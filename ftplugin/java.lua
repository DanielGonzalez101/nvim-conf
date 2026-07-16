-- ~/.config/nvim/ftplugin/java.lua
-- Se ejecuta una vez por buffer Java. Arranca jdtls sin pasar por nvim-lspconfig,
-- usando vim.lsp.start() directamente (lo llama jdtls.start_or_attach internamente).
if vim.b.java_ftplugin_loaded then
	return
end
vim.b.java_ftplugin_loaded = true

local ok, jdtls = pcall(require, "jdtls")
if not ok then
	vim.notify("nvim-jdtls no está instalado", vim.log.levels.WARN)
	return
end

-- ── Rutas ────────────────────────────────────────────────────────────────────

local mason_pkg = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher = vim.fn.glob(mason_pkg .. "/plugins/org.eclipse.equinox.launcher_*.jar")

if launcher == "" then
	vim.notify("jdtls: launcher.jar no encontrado. Ejecuta :MasonInstall jdtls", vim.log.levels.WARN)
	return
end

-- Directorio de config según plataforma/arquitectura
local function os_config_dir()
	local uname = vim.uv.os_uname()
	if uname.sysname == "Darwin" then
		-- M1/M2/M3/M4 usan config_mac_arm; Intel usa config_mac
		local arm = mason_pkg .. "/config_mac_arm"
		if uname.machine == "arm64" and vim.fn.isdirectory(arm) == 1 then
			return arm
		end
		return mason_pkg .. "/config_mac"
	elseif uname.sysname == "Linux" then
		if uname.machine == "aarch64" then
			return mason_pkg .. "/config_linux_arm"
		end
		return mason_pkg .. "/config_linux"
	end
	return mason_pkg .. "/config_win"
end

-- Workspace único POR proyecto, guardado fuera del repo.
-- Usar el nombre del directorio raíz del proyecto evita re-indexar al cambiar de proyecto.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- ── Comando Java + JVM flags ─────────────────────────────────────────────────

local jvm_args = {
	-- Límite de heap: 4 GB es razonable en un M4 con 16 GB+.
	-- Si notas lentitud al abrir proyectos PEQUEÑOS bájalo a -Xmx2G.
	-- Si manejas monorepos muy grandes, súbelo a -Xmx6G.
	"-Xmx4G",
	-- G1GC reduce pauses visibles más que el GC por defecto de JVM
	"-XX:+UseG1GC",
	"-XX:MaxGCPauseMillis=200",
	-- Evita que jdtls escriba .classpath / .project / .settings dentro del repo
	"-Djava.import.generatesMetadataFilesAtProjectRoot=false",
}

-- Lombok: Mason no lo incluye, debes descargarlo manualmente una sola vez:
--   curl -L https://projectlombok.org/downloads/lombok.jar \
--        -o ~/.local/share/nvim/mason/packages/jdtls/lombok.jar
local lombok_jar = mason_pkg .. "/lombok.jar"
if vim.fn.filereadable(lombok_jar) == 1 then
	table.insert(jvm_args, 1, "-javaagent:" .. lombok_jar)
end

local cmd = {
	"java",
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.level=ALL",
}
vim.list_extend(cmd, jvm_args)
vim.list_extend(cmd, {
	"--add-modules=ALL-SYSTEM",
	"--add-opens", "java.base/java.util=ALL-UNNAMED",
	"--add-opens", "java.base/java.lang=ALL-UNNAMED",
	"-jar", launcher,
	"-configuration", os_config_dir(),
	"-data", workspace_dir,
})

-- ── Bundles DAP ──────────────────────────────────────────────────────────────

local bundles = {}
local debug_jar = vim.fn.glob(
	vim.fn.stdpath("data")
		.. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
)
if debug_jar ~= "" then
	table.insert(bundles, debug_jar)
end

-- ── Capabilities (blink.cmp) ─────────────────────────────────────────────────

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

-- ── Config principal ──────────────────────────────────────────────────────────

local config = {
	cmd = cmd,

	-- Busca el root del proyecto subiendo por el árbol de directorios
	root_dir = require("jdtls.setup").find_root({ "mvnw", "gradlew", "pom.xml", "build.gradle", ".git" })
		or vim.fn.getcwd(),

	settings = {
		java = {
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },

			configuration = {
				-- "interactive" te pregunta antes de re-importar cuando cambia pom.xml.
				-- "automatic" re-importa solo (consume más CPU en cada cambio del pom).
				updateBuildConfiguration = "interactive",
			},

			-- Desactivar code lenses de implementaciones/referencias: son un performance
			-- killer en proyectos grandes porque fuerzan análisis cross-file constante.
			-- Actívalos solo si los usas activamente.
			implementationsCodeLens = { enabled = false },
			referencesCodeLens = { enabled = false },

			-- Formatter con 2 espacios (consistente con tu shiftwidth=2)
			-- Para reglas más estrictas (Google Style, etc.) apunta format.settings.url
			-- a un Eclipse formatter XML: https://git.io/eclipse-java-google-style
			format = {
				enabled = true,
				tabSize = 2,
				insertSpaces = true,
			},

			signatureHelp = { enabled = true },

			completion = {
				-- Filtra tipos que casi nunca quieres en el autocompletado
				filteredTypes = { "com.sun.*", "io.micrometer.shaded.*", "java.awt.*", "jdk.*", "sun.*" },
				importOrder = { "java", "javax", "org", "com" },
			},

			sources = {
				organizeImports = {
					-- Umbral alto = nunca colapsa imports en "import com.foo.*"
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
		},
	},

	init_options = { bundles = bundles },
	capabilities = capabilities,

	on_attach = function(_, bufnr)
		local map = vim.keymap.set
		-- LazyVim ya registra en LspAttach: gd, gr, K, <leader>ca, <leader>cr, etc.
		-- Aquí solo agregamos lo específico de jdtls.

		local o = function(desc)
			return { buffer = bufnr, silent = true, desc = desc }
		end

		-- Todas las funciones de jdtls van en lambdas para evitar errores si alguna
		-- no existe en la versión instalada (rhs: expected string|function, got nil)
		map("n", "<leader>ji", function() jdtls.organize_imports() end, o("Java: organize imports"))
		map("n", "<leader>jv", function() jdtls.extract_variable() end, o("Java: extract variable"))
		map("v", "<leader>jv", function() jdtls.extract_variable(true) end, o("Java: extract variable"))
		map("n", "<leader>jm", function() jdtls.extract_method() end, o("Java: extract method"))
		map("v", "<leader>jm", function() jdtls.extract_method(true) end, o("Java: extract method"))
		map("n", "<leader>jc", function() jdtls.extract_constant() end, o("Java: extract constant"))

		-- DAP (solo si java-debug-adapter está instalado)
		if #bundles > 0 then
			jdtls.setup_dap({ hotcodereplace = "auto" })
			local ok_dap, dap = pcall(require, "dap")
			if ok_dap then
				map("n", "<leader>db", function() dap.toggle_breakpoint() end, o("Debug: breakpoint"))
				map("n", "<leader>dc", function() dap.continue() end, o("Debug: continue / run"))
				map("n", "<leader>ds", function() dap.step_over() end, o("Debug: step over"))
				map("n", "<leader>di", function() dap.step_into() end, o("Debug: step into"))
				map("n", "<leader>do", function() dap.step_out() end, o("Debug: step out"))
				-- Detecta las clases con main() en el proyecto; necesario antes del primer debug
				map("n", "<leader>dj", function() jdtls.setup_dap_main_class_configs() end, o("Debug: detect main classes"))
			end
		end
	end,
}

jdtls.start_or_attach(config)

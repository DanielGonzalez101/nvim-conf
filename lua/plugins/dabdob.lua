-- ~/.config/nvim/lua/plugins/dadbod.lua
-- Coloca este archivo en tu carpeta de plugins de Lazy.nvim

return {
	-- Plugin principal de conexión a DB
	{
		"tpope/vim-dadbod",
		lazy = true,
	},

	-- UI tipo DBeaver (panel lateral con árbol de tablas)
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
			"kristijanhusak/vim-dadbod-completion",
			"tpope/vim-dotenv", -- opcional, para cargar .env con las URLs de conexión
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
			{ "<leader>da", "<cmd>DBUIAddConnection<CR>", desc = "Add DB Connection" },
			{ "<leader>df", "<cmd>DBUIFindBuffer<CR>", desc = "Find DB Buffer" },
		},
		init = function()
			-- Directorio donde se guardan las queries guardadas
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"

			-- Mostrar notificación al ejecutar query
			vim.g.db_ui_show_help = 1

			-- Usar íconos (requiere Nerd Font)
			vim.g.db_ui_use_nerd_fonts = 1

			-- Ancho del panel lateral
			vim.g.db_ui_winwidth = 40

			-- Auto ejecutar al guardar archivos .sql en dadbod
			vim.g.db_ui_auto_execute_table_helpers = 1

			-- ============================================================
			-- CONEXIONES - Edita con tus credenciales
			-- ============================================================
			-- Formato de URLs:
			--   PostgreSQL : postgresql://user:password@host:port/database
			--   MySQL      : mysql://user:password@host:port/database
			--   SQLite     : sqlite:///ruta/al/archivo.db

			vim.g.dbs = {
				-- Ejemplos - reemplaza con tus datos reales
				{
					name = "PostgreSQL Local",
					url = "postgresql://postgres:password@localhost:5432/mydb",
				},
				{
					name = "MySQL Local",
					url = "mysql://root:password@localhost:3306/mydb",
				},
				{
					name = "SQLite Ejemplo",
					url = "sqlite:///home/user/mydb.sqlite",
				},
				{
					name = "supabase",
					url = "postgresql://postgres:[YOUR-PASSWORD]@db.xdvsqtytyftwmznrbwjw.supabase.co:5432/postgres",
				},
				-- Puedes agregar más conexiones aquí...
			}
		end,
	},

	-- Autocompletado de tablas y columnas (con nvim-cmp)
	{
		"kristijanhusak/vim-dadbod-completion",
		lazy = true,
		ft = { "sql", "mysql", "plsql" },
		config = function()
			-- Integración con nvim-cmp
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "sql", "mysql", "plsql" },
				callback = function()
					require("cmp").setup.buffer({
						sources = {
							{ name = "vim-dadbod-completion" },
							{ name = "buffer" },
						},
					})
				end,
			})
		end,
	},
}

-- ============================================================
-- ATAJOS DENTRO DE LA UI (modo normal en el panel):
-- ============================================================
--  o / <CR>   → Abrir/expandir nodo (schemas, tablas)
--  R          → Refrescar árbol
--  W          → Toggle ancho del panel
--  d          → Borrar conexión o query guardada
--  A          → Agregar conexión
--  H          → Toggle bases de datos ocultas
--
-- ATAJOS EN EL BUFFER DE QUERY:
--  <leader>W  → Ejecutar query bajo el cursor (DBUI_ExecuteQuery)
--  <leader>S  → Guardar query actual
--  <leader>E  → Editar parámetros
--
-- TIP: Para ejecutar una query rápida sin abrir la UI,
-- selecciona el texto en visual mode y escribe:
--   :'<,'>DB postgresql://user:pass@localhost/mydb
-- ============================================================

-- ============================================================
-- OPCIONAL: Cargar URLs desde .env
-- ============================================================
-- Si usas vim-dotenv, puedes definir en tu .env:
--   DB_URL_POSTGRES=postgresql://user:pass@localhost:5432/mydb
-- Y referenciarla así en vim.g.dbs:
--   url = vim.env.DB_URL_POSTGRES
-- ============================================================

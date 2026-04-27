-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP servers: TypeScript, Python, C#, Java (via nvim-jdtls)
return {
	-- Mason: installs and manages LSP servers, linters, formatters
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
			ensure_installed = {
				-- TypeScript
				"typescript-language-server",
				"prettier",
				"eslint-lsp",
				-- Python
				"pyright",
				"black",
				"isort",
				"ruff",
				-- C#
				"omnisharp",
				"csharpier",
				-- Java (jdtls managed separately via nvim-jdtls)
				"jdtls",
				-- General
				"lua-language-server",
				"stylua",
			},
		},
	},

	-- mason-lspconfig bridge
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
		},
	},

	-- nvim-lspconfig: configure each server
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- Diagnostic display settings
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, source = "if_many" },
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			},
			-- Inlay hints (Neovim 0.10+)
			inlay_hints = { enabled = false },
			-- Servers config
			servers = {
				-- ── TypeScript ──────────────────────────────────────────────────
				ts_ls = {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayReturnTypeHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
							},
						},
					},
				},

				-- ── Python ──────────────────────────────────────────────────────
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},

				-- ── C# (OmniSharp) ──────────────────────────────────────────────
				omnisharp = {
					cmd = { "omnisharp" },
					settings = {
						FormattingOptions = {
							EnableEditorConfigSupport = true,
							OrganizeImports = true,
						},
						MsBuild = { LoadProjectsOnDemand = false },
						RoslynExtensionsOptions = {
							EnableAnalyzersSupport = true,
							EnableImportCompletion = true,
						},
					},
					-- Java handled by nvim-jdtls (see below), NOT here
				},

				-- ── Lua (for Neovim config itself) ──────────────────────────────
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							completion = { callSnippet = "Replace" },
							diagnostics = { globals = { "vim" } },
						},
					},
				},
			},
		},
	},

	-- ── Java: nvim-jdtls ──────────────────────────────────────────────────
	-- More powerful than plain lspconfig for Java
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			local jdtls = require("jdtls")
			local mason_path = vim.fn.stdpath("data") .. "/mason"
			local jdtls_path = mason_path .. "/packages/jdtls"

			-- Workspace: one folder per project, stored in cache
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

			local config = {
				cmd = {
					"java",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.level=ALL",
					"-Xmx2g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-jar",
					vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
					"-configuration",
					jdtls_path .. "/config_mac",
					"-data",
					workspace_dir,
				},
				root_dir = require("jdtls.setup").find_root({
					".git",
					"mvnw",
					"gradlew",
					"pom.xml",
					"build.gradle",
				}),
				settings = {
					java = {
						eclipse = { downloadSources = true },
						configuration = { updateBuildConfiguration = "interactive" },
						maven = { downloadSources = true },
						implementationsCodeLens = { enabled = true },
						referencesCodeLens = { enabled = true },
						references = { includeDecompiledSources = true },
						inlayHints = { parameterNames = { enabled = "all" } },
						format = { enabled = true },
					},
					signatureHelp = { enabled = true },
					completion = {
						favoriteStaticMembers = {
							"org.junit.Assert.*",
							"org.junit.Assume.*",
							"org.junit.jupiter.api.Assertions.*",
							"java.util.Objects.requireNonNull",
							"java.util.Objects.requireNonNullElse",
							"org.mockito.Mockito.*",
						},
					},
				},
				on_attach = function(client, bufnr)
					-- Java-specific keymaps
					local opts = { buffer = bufnr }
					vim.keymap.set(
						"n",
						"<leader>jo",
						jdtls.organize_imports,
						vim.tbl_extend("force", opts, { desc = "Organize imports" })
					)
					vim.keymap.set(
						"n",
						"<leader>jv",
						jdtls.extract_variable,
						vim.tbl_extend("force", opts, { desc = "Extract variable" })
					)
					vim.keymap.set(
						"n",
						"<leader>jc",
						jdtls.extract_constant,
						vim.tbl_extend("force", opts, { desc = "Extract constant" })
					)
					vim.keymap.set(
						"v",
						"<leader>jm",
						[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
						vim.tbl_extend("force", opts, { desc = "Extract method" })
					)
					-- Run tests
					vim.keymap.set(
						"n",
						"<leader>jt",
						jdtls.test_nearest_method,
						vim.tbl_extend("force", opts, { desc = "Test nearest method" })
					)
					vim.keymap.set(
						"n",
						"<leader>jT",
						jdtls.test_class,
						vim.tbl_extend("force", opts, { desc = "Test class" })
					)
				end,
			}

			-- Attach whenever a Java buffer is opened
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					jdtls.start_or_attach(config)
				end,
			})
		end,
	},

	-- Formatting via conform.nvim
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				cs = { "csharpier" },
			},
			-- Quitamos format_on_save, LazyVim lo maneja solo
		},
	},
}

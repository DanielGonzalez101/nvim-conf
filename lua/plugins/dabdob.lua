-- ~/.config/nvim/lua/plugins/dadbod.lua
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
			"tpope/vim-dotenv",
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
			{ "<leader>da", "<cmd>DBUIAddConnection<CR>", desc = "Add DB Connection" },
			{ "<leader>df", "<cmd>DBUIFindBuffer<CR>", desc = "Find DB Buffer" },
		},
		init = function()
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"
			vim.g.db_ui_show_help = 1
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_winwidth = 40
			vim.g.db_ui_auto_execute_table_helpers = 1
			-- ============================================================
			-- CONEXIONES - Edita con tus credenciales
			-- ============================================================
			vim.g.dbs = {
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
					url = "postgresql://postgres:YOUR-PASSWORD@db.xdvsqtytyftwmznrbwjw.supabase.co:5432/postgres",
				},
			}
		end,
	},
	-- Autocompletado de tablas y columnas (con nvim-cmp)
	{
		"kristijanhusak/vim-dadbod-completion",
		lazy = true,
		ft = { "sql", "mysql", "plsql" },
		dependencies = { "hrsh7th/nvim-cmp" }, -- garantiza que cmp se cargue primero
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "sql", "mysql", "plsql" },
				callback = function()
					local ok, cmp = pcall(require, "cmp")
					if not ok then
						return
					end -- si cmp no está listo, salir sin error
					cmp.setup.buffer({
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

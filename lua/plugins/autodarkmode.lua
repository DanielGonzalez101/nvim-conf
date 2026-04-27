return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			{ "ellisonleao/gruvbox.nvim", priority = 1000 },
		},
		config = function()
			-- Desactiva itálicas y bold de gruvbox antes de cargar
			require("gruvbox").setup({
				bold = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = false,
			})

			local auto_dark_mode = require("auto-dark-mode")
			auto_dark_mode.setup({
				update_interval = 1000,
				set_dark_mode = function()
					vim.o.background = "dark"
					vim.cmd("colorscheme gruvbox")
					vim.defer_fn(function()
						vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282828" })
						vim.api.nvim_set_hl(0, "IblIndent", { fg = "#666666" })
						vim.api.nvim_set_hl(0, "IblScope", { fg = "#d79921" })
					end, 100)
				end,
				set_light_mode = function()
					vim.o.background = "light"
					vim.cmd("colorscheme gruvbox")
					vim.defer_fn(function()
						vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FDF1C1" })
						vim.api.nvim_set_hl(0, "IblIndent", { fg = "#d5c4a1" })
						vim.api.nvim_set_hl(0, "IblScope", { fg = "#b57614" })
					end, 100)
				end,
			})
			auto_dark_mode.init()
		end,
	},
}

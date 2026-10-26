return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			{ "Mofiqul/vscode.nvim", priority = 1000 },
			{ "if-not-nil/bark", priority = 1000 },
		},
		config = function()
			local auto_dark_mode = require("auto-dark-mode")
			auto_dark_mode.setup({
				update_interval = 1000,
				set_dark_mode = function()
					vim.o.background = "dark"
					vim.cmd("colorscheme bark")
					require("lualine").setup({ options = { theme = "auto" } })
				end,
				set_light_mode = function()
					vim.o.background = "light"
					require("vscode").load("light")
					require("lualine").setup({ options = { theme = "auto" } })
				end,
			})
			auto_dark_mode.init()
		end,
	},
}

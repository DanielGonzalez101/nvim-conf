return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			{ "if-not-nil/bark", priority = 1000 },
			{ "scottmckendry/cyberdream.nvim", priority = 1000 },
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
					vim.cmd("colorscheme cyberdream-light")
					require("lualine").setup({ options = { theme = "onelight" } })
				end,
			})
			auto_dark_mode.init()
		end,
	},
}

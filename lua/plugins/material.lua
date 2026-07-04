return {
	{
		"marko-cerovac/material.nvim",
		enabled = false,
		priority = 1000,
		opts = {
			contrast = {
				terminal = false,
				sidebars = false,
				floating_windows = false,
				cursor_line = false,
				non_current_windows = false,
			},
			styles = {
				comments = { italic = false },
				strings = { italic = false },
				keywords = {},
				functions = {},
				variables = {},
			},
			plugins = {
				"gitsigns",
				"indent-blankline",
				"neo-tree",
				"nvim-cmp",
				"telescope",
				"trouble",
				"which-key",
			},
			lualine_style = "default",
		},
		config = function(_, opts)
			require("material").setup(opts)
			vim.g.material_style = "deep ocean"
			vim.cmd("colorscheme material")
		end,
	},
}
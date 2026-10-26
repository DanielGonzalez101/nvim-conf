return {
	{
		"taigrr/cyberpunk.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberpunk").setup({})
		end,
	},
}

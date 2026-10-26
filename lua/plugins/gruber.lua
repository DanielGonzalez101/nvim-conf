return {
	{
		"DWDW2/gruber",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("gruber").setup({})
		end,
	},
}

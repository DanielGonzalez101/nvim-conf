return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			size = 15,
			shade_terminals = false,
		})
	end,
}

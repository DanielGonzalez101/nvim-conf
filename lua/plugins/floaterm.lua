return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			size = 15,
			shade_terminals = false,
			highlights = {
				Normal = { guibg = "#282828" },
				NormalFloat = { guibg = "#282828" },
			},
		})
	end,
}

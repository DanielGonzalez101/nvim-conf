return {
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			compile = false,
			undercurl = true,
			commentStyle = { italic = false },
			functionStyle = {},
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
			colors = {
				theme = {
					dragon = {
						ui = {
							bg = "#000000",
							bg_dim = "#000000",
							bg_gutter = "#000000",
						},
					},
				},
			},
		},
	},
}

return {
	"coder/claudecode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		terminal_cmd = "/opt/homebrew/bin/claude",
		terminal = {
			provider = "native",
			split_side = "right",
			split_width_percentage = 0.35,
			auto_close = false,
		},
		diff_opts = {
			layout = "vertical", -- "vertical" = lado a lado | "horizontal" = arriba/abajo
			open_in_new_tab = true, -- abre el diff en una tab nueva (pantalla completa)
			hide_terminal_in_new_tab = true, -- oculta la terminal en esa tab para ver solo el diff
			keep_terminal_focus = false,
		},
	},

	config = function(_, opts)
		require("claudecode").setup(opts)
	end,

	keys = {
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
		{
			"<leader>ao",
			function()
				-- Cierra el panel izquierdo (original) del diff, deja solo el nuevo
				local wins = vim.api.nvim_tabpage_list_wins(0)
				if #wins >= 2 then
					vim.api.nvim_win_close(wins[1], false)
				end
			end,
			desc = "Diff: cerrar panel original (ver solo nuevo)",
		},
	},
}

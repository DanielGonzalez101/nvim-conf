return {
	"coder/claudecode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		terminal_cmd = "/opt/homebrew/bin/claude", -- cambia a "~/.claude/local/claude" si `which claude` apunta ahí
		terminal = {
			provider = "native",
			split_side = "right",
			split_width_percentage = 0.35,
			auto_close = false, -- ← IMPORTANTE: evita que se cierre solo
		},
	},

	config = function(_, opts)
		require("claudecode").setup(opts)
	end,

	keys = {
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
	},
}

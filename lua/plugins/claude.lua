return {
	"coder/claudecode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		terminal = {
			provider = "native",
			split_side = "right",
			split_width = 80,
		},
	},

	config = function(_, opts)
		require("claudecode").setup(opts)

		-- 🔒 Bloquear tamaño de la ventana del chat
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "claudecode",
			callback = function()
				vim.wo.winfixwidth = true
				vim.wo.winfixheight = true
			end,
		})
		vim.api.nvim_create_autocmd("WinEnter", {
			callback = function()
				local ft = vim.bo.filetype
				if ft == "claudecode" then
					vim.cmd("vertical resize 80")
					vim.wo.winfixwidth = true
				end
			end,
		})
	end,

	keys = {
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
	},
}

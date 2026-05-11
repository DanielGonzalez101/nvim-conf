-- ~/.config/nvim/lua/plugins/extras.lua
-- Quality-of-life plugins on top of LazyVim defaults
return {
	-- Better statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				--theme = "moonfl",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},

	-- Tabs / bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		enabled = false,
		opts = {
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = true,
				show_close_icon = false,
				separator_style = "slant",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		},
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { enabled = false },
		},
	},

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { check_ts = true },
	},

	-- Comment toggle
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Git signs in gutter
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = vim.keymap.set
				map("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
				map("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev hunk" })
				map("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
				map("n", "<leader>gb", gs.blame_line, { buffer = bufnr, desc = "Blame line" })
				map("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
				map("n", "<leader>gS", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
			end,
		},
	},

	-- Better notifications
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
	},

	-- Highlight TODO/FIXME/HACK/NOTE comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "BufReadPost",
		opts = {},
		keys = {
			{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
		},
	},

	-- Better diagnostics list
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<CR>",
				desc = "Diagnostics (Trouble)",
			},
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
			{ "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP definitions" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
		},
	},

	-- Which-key: shows keybindings as you type
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>tn", desc = "Toggle terminal" },
				{ "<leader>f", group = "find/files" },
				{ "<leader>g", group = "git" },
				{ "<leader>x", group = "diagnostics/trouble" },
				{ "<leader>j", group = "java" },
				{ "<leader>b", group = "buffers" },
				{ "<leader>y", group = "yank/clipboard" },
				{ "<leader>D", desc = "Delete to void" },
			},
		},
	},

	-- Treesitter: better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"typescript",
				"javascript",
				"tsx",
				"python",
				"c_sharp",
				"java",
				"json",
				"yaml",
				"toml",
				"markdown",
				"bash",
				"html",
				"css",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}

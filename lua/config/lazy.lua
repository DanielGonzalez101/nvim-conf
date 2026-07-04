-- ~/.config/nvim/lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Leader keys (must be set before lazy loads plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Overrides que LazyVim pisa después de cargar
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.opt.cursorline = false
		vim.opt.cursorcolumn = false
		vim.opt.colorcolumn = ""
		vim.opt.list = false
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.documentHighlightProvider = false
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "RRethy/vim-illuminate", enabled = false },
		{
			"folke/snacks.nvim",
			opts = {
				words = { enabled = false },
				image = { enabled = true },
				explorer = {
					replace_netrw = true,
				},
				picker = {
					sources = {
						explorer = {
							hidden = true,
							ignored = true,
							auto_close = true,
						},
					},
				},
			},
		},
		{ "folke/noice.nvim", enabled = false },
		{ "folke/which-key.nvim", enabled = false },
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "cyberdream", "bark", "material" } },
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

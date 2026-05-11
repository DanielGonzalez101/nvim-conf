local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs / indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split" -- live preview of :s substitutions

-- UI
opt.wrap = false
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.cursorline = false
opt.cursorcolumn = false
opt.colorcolumn = ""
opt.list = false

-- Performance / responsiveness
opt.updatetime = 250
opt.timeoutlen = 300

-- Splits
opt.splitright = true
opt.splitbelow = true
opt.equalalways = false

-- Clipboard: sync unnamed register with system clipboard
opt.clipboard = "unnamedplus"

-- Persistence
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Misc
opt.confirm = true       -- prompt before discarding unsaved changes
opt.virtualedit = "block" -- allow cursor past EOL in block-visual mode

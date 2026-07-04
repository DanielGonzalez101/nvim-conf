-- ~/.config/nvim/lua/config/keymaps.lua
-- Demo: así se ve el diff en tab nueva con open_in_new_tab = true
local map = vim.keymap.set

--Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Neo-tree
map("n", "<C-b>", function()
	Snacks.explorer()
end, { desc = "Toggle Explorer" })
map("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })
map("n", "<leader>ge", ":Neotree git_status<CR>", { desc = "Neo-tree Git Status" })

-- Terminal
map("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle terminal horizontal" })
map("n", "<C-t>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("t", "<C-t>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal → left window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal → bottom window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal → top window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal → right window" })

-- Telescope / file finder
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Grep word under cursor" })

-- Buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Save & quit shortcuts
--map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<C-q>", ":q<CR>", { desc = "Quit" })
--map("n", "<C-Q>", ":qa!<CR>", { desc = "Force quit all" })

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Copy / paste
-- Pegar en visual sin sobreescribir el clipboard
map("x", "p", '"_dP', { desc = "Paste without overwriting clipboard" })
-- Borrar un solo caracter sin afectar el clipboard
map({ "n", "v" }, "x", '"_x', { desc = "Delete char without yank" })
-- Eliminar al registro void (no toca el clipboard)
map({ "n", "v" }, "<leader>D", '"_d', { desc = "Delete to void (no clipboard)" })
-- Copiar explícitamente al clipboard del sistema
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Pegar desde el clipboard del sistema (normal y antes del cursor)
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard (after)" })
map("n", "<leader>P", '"+P', { desc = "Paste from system clipboard (before)" })

-- Pegar en insert mode desde el clipboard del sistema sin romper indentación
-- <C-r><C-o>+ inserta literalmente sin triggear autoindent ni formateo
map("i", "<C-v>", "<C-r><C-o>+", { desc = "Paste from system clipboard (insert)" })
map("c", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard (command line)" })

-- Diagnostics
--map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
--map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
--map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Window navigation inside splits using sensible keys
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split" }) -- close current split window

-- Up and Down in word wrapped line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Moving lines
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Stay in indent mode with visual selection
vim.keymap.set("v", "<", "<gv", { desc = "Unindent selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selection" })

-- Clear Search Highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlight and escape" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle Line Wrap" })




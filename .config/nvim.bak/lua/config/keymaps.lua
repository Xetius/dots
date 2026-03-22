vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlight and escape" })

-- -- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split" }) -- close current split window

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle Line Wrap" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Unindent selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selection" })

-- Up and Down in word wrapped line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
--
-- Vim-Tmux-Navigator
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateLeft<cr>", { desc = "Move to left Pane" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>", { desc = "Move to below Pane" })
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateUp<cr>", { desc = "Move to above Pane" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>", { desc = "Move to right Pane" })

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>fp", telescope.builtin, { desc = "Telescope pickers" })
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fk", telescope.keymaps, { desc = "Telescope keymaps" })

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open Oil" })

-- Harpoon2
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Add to Harpoon" })
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon" })
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "Previous Harpoon File" })
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "Next Harpoon File" })
vim.keymap.set("n", "<A-1>", function()
	harpoon:list():select(1)
end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<A-2>", function()
	harpoon:list():select(2)
end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<A-3>", function()
	harpoon:list():select(3)
end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<A-4>", function()
	harpoon:list():select(4)
end, { desc = "Harpoon file 4" })
vim.keymap.set("n", "<A-5>", function()
	harpoon:list():select(5)
end, { desc = "Harpoon file 5" })

-- Atone keymap (undo tree)
vim.keymap.set("n", "<leader>uu", "<cmd>Atone toggle<cr>", { desc = "Toggle Atone undo tree" })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)

vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfil List (Trouble)" })

-- Peek
vim.keymap.set("n", "<leader>mp", function()
	local peek = require("peek")
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end, { desc = "Toggle Peek" })

-- Conform
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format Code" })

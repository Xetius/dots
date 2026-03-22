vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.g.have_nerd_font = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.mouse = "a"

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.splitright = true
vim.o.splitbelow = true
--
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.cursorline = true
vim.o.scrolloff = 10

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.background = "dark"
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"
vim.o.autoread = true

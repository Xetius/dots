vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
})

vim.cmd.colorscheme('miniwinter')

require('mini.basics').setup()
require('mini.icons').setup()
require('mini.surround').setup()
require('mini.files').setup({
  mappings = {
    close = '<esc>',
    go_in = '<cr>',
  }
})
require('mini.ai').setup()
require('mini.clue').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.snippets').setup()
require('mini.diff').setup()
require('mini.extra').setup()
require('mini.fuzzy').setup()
require('mini.git').setup()
require('mini.hipatterns').setup()
require('mini.indentscope').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.splitjoin').setup()
require('mini.statusline').setup()
require('mini.trailspace').setup()

vim.keymap.set("n", "<leader>e", function() require('mini.files').open() end, { desc = "MiniFiles open" })

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file('~/.config/nvim/snippets/global.json'),
    gen_loader.from_lang(),
  },
})



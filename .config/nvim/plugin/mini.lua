vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
})

require('mini.basics').setup()
require('mini.icons').setup()
require('mini.surround').setup()
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.diff').setup()
require('mini.extra').setup()
require('mini.hipatterns').setup({
  highlighters = {
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
  },
})
require('mini.indentscope').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.splitjoin').setup()
require('mini.statusline').setup()


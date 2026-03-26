vim.pack.add ({
  { src = 'https://github.com/stevearc/oil.nvim' },
})

require('oil').setup({
  columns = {
    "icon",
    "permissions", 
  },
  view_options = {
    show_hidden = true,
  }
})

vim.keymap.set ('n', '<leader>e', '<cmd>Oil<cr>', { desc = 'Browse files' })


vim.pack.add ({
  'https://github.com/stevearc/conform.nvim',
})

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    go = { 'goimports', 'gofumpt' },
    yaml = { 'yamlfmt' },
  }
})

vim.keymap.set('n', '<leader>cf', function() require('conform').format({ lsp_format = 'fallback' }) end, { desc = 'Code format' })


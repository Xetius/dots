vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    vim.lsp.inline_completion.enable(true)
    vim.keymap.set({'i', 'n'}, '<C-j>', function()
      vim.lsp.inline_completion.get()
    end, {
      desc = 'Get the current inline completion',
    })

    vim.keymap.set('i', '<C-]>', function()
      vim.lsp.inline_completion.select()
    end)
  end,
})

vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    'lua_ls',
    'stylua',
    'pyright',
    'terraformls',
    'yamlls',
    'yamllint',
    'kube-linter',
    'kubescape',

  }
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})


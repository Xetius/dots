vim.lsp.log.set_level('ERROR')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    vim.lsp.inline_completion.enable(true)
    vim.keymap.set({'i', 'n'}, '<C-.>', function()
      vim.lsp.inline_completion.get()
    end, {
      desc = 'Get the current inline completion',
    })

    vim.keymap.set('i', '<C-p>', function()
      vim.lsp.inline_completion.select_prev()
    end)
    vim.keymap.set('i', '<C-n>', function()
      vim.lsp.inline_completion.select()
    end)
  end,
})

vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/saghem/blink.cmp' },
})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    'lua_ls',
    'stylua',
    'pyright',
    'ruff',
    'debugpy',
    'gopls',
    'gofumpt',
    'goimports',
    'golangci-lint',
    'delve',
    'terraformls',
    'yamlls',
    'yamllint',
    'kube-linter',
    'kubescape',
    'black',
    'isort',
  }
})

local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities())
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

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

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      lint = { enable = true },
    },
  },
})

vim.diagnostic.config({
  virtual_text = {
    current_line = true,
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "◆",
      [vim.diagnostic.severity.INFO] = "■",
    },
  },
  float = {
    border = "rounded",
    source = true,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

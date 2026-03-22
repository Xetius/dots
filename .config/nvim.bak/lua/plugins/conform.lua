return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports-reviser', 'gofumpt' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        markdown = { 'markdown-prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
      formatters = {
        ['markdown-prettier'] = {
          command = 'prettier',
          args = { '--prose-wrap', 'always', '--print-width', '80', '--parser', 'markdown', '--stdin-filepath', '$FILENAME' },
          stdin = true,
        },
      },
    })
  end,
}

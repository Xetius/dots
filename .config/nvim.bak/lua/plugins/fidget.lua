return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      override_vim_notify = true,
      window = {
        winblend = 0,
      },
    },
    progress = {
      suppress_on_insert = true,
      ignore_done_already = true,
      ignore = { "null-ls" },
      display = {
        done_ttl = 1,
        progress_style = "WarningMsg",
        group_style = "Title",
        icon_style = "Question",
        done_style = "Constant",
      },
    },
  },
}

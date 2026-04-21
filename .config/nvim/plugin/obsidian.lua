vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  { src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range "*" },
})

require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/vaults/work",
    },
  },
  completion = {
    nvim_cmp = false,
    blink = true,
    min_chars = 2,
  },
  ui = {
    enable = false,
  },
  picker = {
    name = "telescope.nvim",
  },
  daily_notes = {
    folder = "daily",
    date_format = "%Y-%m-%d",
  },
  new_notes_location = "current_dir",
  disable_frontmatter = false,
})

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Obsidian: new note" })
vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian open<cr>", { desc = "Obsidian: open in app" })
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Obsidian: search" })
vim.keymap.set("n", "<leader>oq", "<cmd>Obsidian quick_switch<cr>", { desc = "Obsidian: quick switch" })
vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian today<cr>", { desc = "Obsidian: today" })
vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday<cr>", { desc = "Obsidian: yesterday" })
vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "Obsidian: backlinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>Obsidian links<cr>", { desc = "Obsidian: links in buffer" })
vim.keymap.set("n", "<leader>of", "<cmd>Obsidian follow_link<cr>", { desc = "Obsidian: follow link" })
vim.keymap.set("n", "<leader>or", "<cmd>Obsidian rename<cr>", { desc = "Obsidian: rename" })
vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<cr>", { desc = "Obsidian: paste image" })

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'telescope-fzf-native' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('telescope-fzf-native') end
    vim.schedule(function()
      vim.system({'make'})
    end)
  end
end })

vim.pack.add ({
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

-- Fidget Telescope Extension
require('telescope').load_extension('fidget')
vim.keymap.set('n', '<leader>fn', function() require('telescope').extensions.fidget.fidget() end, { desc = 'Telescope fidget notifs' })


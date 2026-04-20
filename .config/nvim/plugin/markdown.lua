vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'peek' and (kind == 'update' or kind == 'install') then
    if not ev.data.active then vim.cmd.packadd('peek') end
    vim.cmd('deno task --quiet build:fast')
  end
end })

vim.pack.add ({
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/tadmccorkle/markdown.nvim',
  'https://github.com/toppair/peek.nvim',
})

require('markdown').setup()
require('render-markdown').setup({
  latex = { enabled = false },
})
require('peek').setup()
local peek = require('peek')

local function peek_toggle()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end

vim.api.nvim_create_user_command('PeekOpen', peek.open, {})
vim.api.nvim_create_user_command('PeekClose', peek.close, {})

vim.api.nvim_create_user_command('PeekToggle', function()
  if vim.bo[vim.api.nvim_get_current_buf()].filetype == 'markdown' then
     peek.toggle()
  end
end, {})

vim.keymap.set('n', '<leader>mp', peek_toggle, { desc = 'Toggle Peek' })


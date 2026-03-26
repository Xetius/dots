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
require('render-markdown').setup()
require('peek').setup()

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})


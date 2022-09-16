local M = {}

M.setup = function()
  vim.keymap.set('n', '<Leader>e', ':HopWord<cr>')
  vim.keymap.set('n', '<Leader>s', ':HopChar2<cr>')
end

M.config = function()
  require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
end

return M

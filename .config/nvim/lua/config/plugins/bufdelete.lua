local M = {}

M.setup = function()
  vim.keymap.set('n', 'bd', ':Bdelete<cr>')
end

M.config = function()
end

return M

local M = {}

M.setup = function()
  vim.keymap.set('n', '-', ':Switch<cr>')
end

M.config = function()
end

return M

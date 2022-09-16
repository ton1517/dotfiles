local M = {}

M.setup = function()
  vim.keymap.set('v', 'a>', ':Align =><CR>')
  vim.keymap.set('v', 'a=', ':Align =<CR>')
end

M.config = function()
end

return M

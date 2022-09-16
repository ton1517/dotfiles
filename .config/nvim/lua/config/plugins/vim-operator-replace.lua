local M = {}

M.setup = function()
  vim.keymap.set('', '<S-r>', '<Plug>(operator-replace)')
end

M.config = function()
end

return M

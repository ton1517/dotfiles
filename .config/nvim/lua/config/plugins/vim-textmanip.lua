local M = {}

M.setup = function()
  vim.keymap.set('x', '<S-j>', '<Plug>(textmanip-move-down)')
  vim.keymap.set('x', '<S-k>', '<Plug>(textmanip-move-up)')
  vim.keymap.set('x', '<S-h>', '<Plug>(textmanip-move-left)')
  vim.keymap.set('x', '<S-l>', '<Plug>(textmanip-move-right)')

  vim.keymap.set({ 'n', 'x' }, '<Space>d', '<Plug>(textmanip-duplicate-down)')
  vim.keymap.set({ 'n', 'x' }, '<Space>D', '<Plug>(textmanip-duplicate-up)')
end

M.config = function()
end

return M

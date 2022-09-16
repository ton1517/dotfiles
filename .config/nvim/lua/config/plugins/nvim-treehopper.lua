local M = {}

M.setup = function()
  vim.keymap.set('o', 'm', ":<C-U>lua require('tsht').nodes()<CR>")
  vim.keymap.set('x', 'm', ":lua require('tsht').nodes()<CR>")
end

M.config = function()
end

return M

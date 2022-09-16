local M = {}

M.setup = function()
  vim.keymap.set('n', ',j', ":lua require('trevj').format_at_cursor()<CR>")
end

M.config = function()
  require("trevj").setup()
end

return M

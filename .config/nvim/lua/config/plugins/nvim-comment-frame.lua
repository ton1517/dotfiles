local M = {}

M.setup = function()
  vim.keymap.set('n', '<leader>cf', ":lua require('nvim-comment-frame').add_comment()<CR>")
  vim.keymap.set('n', '<leader>Cf', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>")
end

M.config = function()
  require('nvim-comment-frame').setup({
    disable_default_keymap = true,
  })
end

return M

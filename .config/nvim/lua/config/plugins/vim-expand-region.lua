local M = {}

M.setup = function()
  vim.keymap.set('v', 'v', '<Plug>(expand_region_expand)')
  vim.keymap.set('v', '<C-v>', '<Plug>(expand_region_shrink)')
end

M.config = function()
end

return M

local M = {}

M.setup = function()
	vim.keymap.set("", "<C-j>", "<Plug>(edgemotion-j)")
	vim.keymap.set("", "<C-k>", "<Plug>(edgemotion-k)")
end

M.config = function() end

return M

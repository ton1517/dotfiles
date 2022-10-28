local M = {}

M.setup = function()
	local opt = { silent = true }
	vim.keymap.set("", "<C-j>", "<Plug>(edgemotion-j)", opt)
	vim.keymap.set("", "<C-k>", "<Plug>(edgemotion-k)", opt)
end

M.config = function() end

return M

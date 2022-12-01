local M = {}

M.setup = function() end

M.config = function()
	local keymap = vim.keymap.set
	keymap("n", "<C-g><C-b>", "<cmd>Git blame<cr>")
	keymap("n", "<C-g><C-o>", "<cmd>GBrowse<cr>")
end

return M

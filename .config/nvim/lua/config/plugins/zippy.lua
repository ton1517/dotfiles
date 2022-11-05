local M = {}

M.setup = function()
	vim.keymap.set("n", "<leader>lg", "<cmd>lua require('zippy').insert_print()<CR>")
end

M.config = function() end

return M

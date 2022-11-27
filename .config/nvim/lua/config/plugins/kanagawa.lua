local M = {}

M.setup = function() end

M.config = function()
	require("kanagawa").setup({
		dimInactive = true,
	})
	vim.cmd([[colorscheme kanagawa]])
end

return M

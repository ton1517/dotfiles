local M = {}

M.setup = function() end

M.config = function()
	require("mason-lspconfig").setup({})
end

return M

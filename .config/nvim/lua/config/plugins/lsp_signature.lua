local M = {}

M.setup = function() end

M.config = function()
	require("lsp_signature").setup()
end

return M

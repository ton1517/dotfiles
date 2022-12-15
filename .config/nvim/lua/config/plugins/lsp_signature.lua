local M = {}

M.setup = function() end

M.config = function()
	require("lsp_signature").setup({
		floating_window = false,
		toggle_key = "<C-k>",
		hint_prefix = " ",
	})
end

return M

local M = {}

M.setup = function() end

M.config = function()
	require("bqf").setup({
		func_map = {
			pscrollup = "<C-u>",
			pscrolldown = "<C-d>",
		},
	})
end

return M

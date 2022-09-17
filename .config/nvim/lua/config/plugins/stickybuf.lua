local M = {}

M.setup = function() end

M.config = function()
	require("stickybuf").setup({
		filetype = {
			["neo-tree"] = "filetype",
		},
	})
end

return M

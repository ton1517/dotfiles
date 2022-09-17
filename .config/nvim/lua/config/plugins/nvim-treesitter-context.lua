local M = {}

M.setup = function() end

M.config = function()
	require("treesitter-context").setup({
		enable = true,
		throttle = true,
		max_lines = 0,
		patterns = {
			default = { "class", "function", "method" },
		},
	})
end

return M

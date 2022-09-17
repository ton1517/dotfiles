local M = {}

M.setup = function() end

M.config = function()
	require("alpha").setup(require("alpha.themes.startify").config)
end

return M

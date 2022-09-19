local M = {}

M.setup = function() end

M.config = function()
	local path = require("mason-core.path")
	local cmd_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" })
	require("go").setup({
		gopls_cmd = { cmd_root_dir .. "/go/gopls" },
	})
end

return M

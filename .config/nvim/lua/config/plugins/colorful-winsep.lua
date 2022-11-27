local M = {}

M.setup = function() end

M.config = function()
	require("colorful-winsep").setup({
		no_exec_files = { "packer", "TelescopePrompt", "mason", "neo-tree" },
	})
end

return M

local M = {}

M.setup = function()
	vim.api.nvim_create_user_command("DiffviewOpenMain", "DiffviewOpen main...HEAD", {})
	vim.api.nvim_create_user_command("DiffviewOpenMaster", "DiffviewOpen master...HEAD", {})
	vim.api.nvim_create_user_command("DiffviewOpenDevelop", "DiffviewOpen develop...HEAD", {})
end

M.config = function()
	require("diffview").setup({
		enhanced_diff_hl = true,
	})
end

return M

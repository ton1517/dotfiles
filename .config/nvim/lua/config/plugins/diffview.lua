return {
	-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewFileHistory" },

	init = function()
		vim.api.nvim_create_user_command("DiffviewOpenMain", "DiffviewOpen main...HEAD", {})
		vim.api.nvim_create_user_command("DiffviewOpenMaster", "DiffviewOpen master...HEAD", {})
		vim.api.nvim_create_user_command("DiffviewOpenDevelop", "DiffviewOpen develop...HEAD", {})
	end,

	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
		})
	end,
}

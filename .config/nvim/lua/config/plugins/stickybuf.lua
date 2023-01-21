return {
	-- Neovim plugin for locking a buffer to a window
	"stevearc/stickybuf.nvim",
	event = "VeryLazy",

	config = function()
		require("stickybuf").setup({
			filetype = {
				["neo-tree"] = "filetype",
			},
		})
	end,
}

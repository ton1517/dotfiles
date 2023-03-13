return {
	-- Neovim plugin for locking a buffer to a window
	"stevearc/stickybuf.nvim",
	event = "VeryLazy",

	config = function()
		require("stickybuf").setup({
			get_auto_pin = function(bufnr)
				local filetype = vim.bo[bufnr].filetype
				if filetype == "neo-tree" then
					return "filetype"
				end

				return require("stickybuf").should_auto_pin(bufnr)
			end,
		})
	end,
}

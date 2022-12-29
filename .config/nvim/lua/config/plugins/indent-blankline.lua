return {
	-- This plugin adds indentation guides to all lines (including empty lines).
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",

	config = function()
		require("indent_blankline").setup({
			show_current_context = true,
			show_current_context_start = true,
		})
	end,
}

return {
	-- Smart and Powerful commenting plugin for neovim
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
}

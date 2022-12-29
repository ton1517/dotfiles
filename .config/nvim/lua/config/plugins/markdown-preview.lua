return {
	-- markdown preview plugin for (neo)vim
	"iamcco/markdown-preview.nvim",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = "markdown",
}

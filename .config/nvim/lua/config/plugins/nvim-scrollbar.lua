return {
	-- Extensible Neovim Scrollbar
	"petertriho/nvim-scrollbar",
	dependencies = { "kevinhwang91/nvim-hlslens", "lewis6991/gitsigns.nvim" },
	event = "VeryLazy",

	config = function()
		require("scrollbar.handlers.search").setup()
		require("scrollbar.handlers.gitsigns").setup()
		require("scrollbar").setup({
			show = true,
			set_highlights = true,
			handle = {
				color = "#777777",
			},
			marks = {
				Search = { color = "#ff9e64" },
				Error = { color = "#db4b4b" },
				Warn = { color = "#e0af68" },
				Info = { color = "#0db9d7" },
				Hint = { color = "#1abc9c" },
				Misc = { color = "#9d7cd8" },
				GitAdd = {
					color = "#9ed072",
					text = "+",
				},
				GitDelete = {
					color = "#fc5d7c",
					text = "-",
				},
				GitChange = {
					color = "#76cce0",
					text = "*",
				},
			},
			handlers = {
				diagnostic = true,
				search = true,
				gitsigns = true,
			},
			excluded_filetypes = {
				"neo-tree",
			},
		})
	end,
}

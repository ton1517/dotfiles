return {
	-- Smart and Powerful commenting plugin for neovim
	"numToStr/Comment.nvim",
	keys = {
		{ "<Plug>(comment_toggle_linewise_current)", mode = "n" },
		{ "<Plug>(comment_toggle_blockwise_current)", mode = "n" },
		{ "<Plug>(comment_toggle_linewise)", mode = "n" },
		{ "<Plug>(comment_toggle_blockwise", mode = "n" },
		{ "<Plug>(comment_toggle_linewise_visual)", mode = "x" },
		{ "<Plug>(comment_toggle_blockwise_visual)", mode = "x" },
	},

	init = function()
		vim.keymap.set("n", "gcc", "<Plug>(comment_toggle_linewise_current)")
		vim.keymap.set("n", "gc", "<Plug>(comment_toggle_linewise)")
		vim.keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)")

		vim.keymap.set("n", "gbc", "<Plug>(comment_toggle_blockwise_current)")
		vim.keymap.set("n", "gb", "<Plug>(comment_toggle_blockwise)")
		vim.keymap.set("x", "gb", "<Plug>(comment_toggle_blockwise_visual)")
	end,
	config = function()
		require("Comment").setup({
			mappings = { basic = false, extra = false },
		})
	end,
}

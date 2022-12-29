return {
	-- Detects the language using treesitter and adds a comment block
	"s1n7ax/nvim-comment-frame",
	dependencies = "nvim-treesitter/nvim-treesitter",
	lazy = true,

	init = function()
		vim.keymap.set("n", "<leader>cf", ":lua require('nvim-comment-frame').add_comment()<CR>")
		vim.keymap.set("n", "<leader>Cf", ":lua require('nvim-comment-frame').add_multiline_comment()<CR>")
	end,

	config = function()
		require("nvim-comment-frame").setup({
			disable_default_keymap = true,
		})
	end,
}

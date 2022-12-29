return {
	-- Neovim plugin for splitting/joining blocks of code
	"Wansmer/treesj",
	dependencies = "nvim-treesitter/nvim-treesitter",
	cmd = "TSJToggle",

	init = function()
		vim.keymap.set("n", ",j", ":TSJToggle<CR>")
	end,

	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
}

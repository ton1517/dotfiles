return {
	-- easy text manupilation for vim
	"t9md/vim-textmanip",
	keys = {
		{ "<S-j>", "<Plug>(textmanip-move-down)", mode = "x" },
		{ "<S-k>", "<Plug>(textmanip-move-up)", mode = "x" },
		{ "<S-h>", "<Plug>(textmanip-move-left)", mode = "x" },
		{ "<S-l>", "<Plug>(textmanip-move-right)", mode = "x" },

		{ "<leader>d", "<Plug>(textmanip-duplicate-down)", mode = { "n", "x" } },
		{ "<leader>D", "<Plug>(textmanip-duplicate-up)", mode = { "n", "x" } },
	},
}

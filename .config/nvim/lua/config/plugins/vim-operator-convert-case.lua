return {
	--  provide some operators to convert a word case.
	"mopp/vim-operator-convert-case",
	dependencies = { "kana/vim-operator-user", "tpope/vim-repeat" },
	keys = {
		{ "<Plug>(operator-convert-case-", mode = { "n", "v" } },
	},

	init = function()
		vim.keymap.set("n", ",clc", "<Plug>(operator-convert-case-lower-camel)iw")
		vim.keymap.set("n", ",cuc", "<Plug>(operator-convert-case-upper-camel)iw")
		vim.keymap.set("n", ",cls", "<Plug>(operator-convert-case-lower-snake)iw")
		vim.keymap.set("n", ",cus", "<Plug>(operator-convert-case-upper-snake)iw")
		vim.keymap.set("v", ",clc", "<Plug>(operator-convert-case-lower-camel)gv")
		vim.keymap.set("v", ",cuc", "<Plug>(operator-convert-case-upper-camel)gv")
		vim.keymap.set("v", ",cls", "<Plug>(operator-convert-case-lower-snake)gv")
		vim.keymap.set("v", ",cus", "<Plug>(operator-convert-case-upper-snake)gv")
	end,
}

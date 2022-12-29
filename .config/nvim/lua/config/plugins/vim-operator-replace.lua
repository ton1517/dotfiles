return {
	-- Operator to replace text with register content
	"kana/vim-operator-replace",
	dependencies = "kana/vim-operator-user",
	keys = {
		{ "<Plug>(operator-replace)", mode = { "n", "v" } },
	},
	init = function()
		vim.keymap.set("", "<S-r>", "<Plug>(operator-replace)")
	end,
}

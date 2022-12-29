return {
	-- A Git wrapper so awesome, it should be illegal
	"tpope/vim-fugitive",

	config = function()
		local keymap = vim.keymap.set
		keymap("n", "<C-g><C-b>", "<cmd>Git blame<cr>")
		keymap("n", "<C-g><C-o>", "<cmd>GBrowse<cr>")
	end,
}

return {
	-- A Git wrapper so awesome, it should be illegal
	"tpope/vim-fugitive",
	dependencies = {
		-- GitHub extension for fugitive.vim
		"tpope/vim-rhubarb",
	},
	cmd = { "Git", "GBrowse" },

	init = function()
		local keymap = vim.keymap.set
		keymap("n", "<C-g><C-b>", "<cmd>Git blame<cr>")
		keymap("n", "<C-g><C-o>", "<cmd>GBrowse<cr>")
	end,
}

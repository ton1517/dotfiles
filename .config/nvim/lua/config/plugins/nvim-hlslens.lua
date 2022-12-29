return {
	-- Hlsearch Lens for Neovim
	"kevinhwang91/nvim-hlslens",
	lazy = true,
	init = function()
		vim.keymap.set("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
		vim.keymap.set("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
	end,
	config = true,
}

return {
	-- asterisk.vim provides improved * motions.
	"haya14busa/vim-asterisk",
	dependencies = "kevinhwang91/nvim-hlslens",
	event = "VeryLazy",

	init = function()
		vim.g["asterisk#keeppos"] = 1
		vim.keymap.set("", "*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>")
		vim.keymap.set("", "#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>")
		vim.keymap.set("", "g*", "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>")
		vim.keymap.set("", "g#", "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>")
	end,
}

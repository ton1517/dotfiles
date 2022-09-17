local M = {}

M.setup = function()
	vim.g["asterisk#keeppos"] = 1
	vim.keymap.set("", "*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>")
	vim.keymap.set("", "#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>")
	vim.keymap.set("", "g*", "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>")
	vim.keymap.set("", "g#", "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>")
end

M.config = function() end

return M

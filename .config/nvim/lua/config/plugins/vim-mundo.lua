local M = {}

M.setup = function()
	vim.keymap.set("n", ",mu", ":MundoToggle<CR>")
end

M.config = function() end

return M

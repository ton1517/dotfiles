local M = {}

M.setup = function()
	vim.keymap.set("n", ",tb", ":AerialOpen<CR>")
end

M.config = function()
	require("aerial").setup({})
end

return M

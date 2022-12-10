local M = {}

M.setup = function()
	vim.keymap.set("n", ",j", ":TSJToggle<CR>")
end

M.config = function()
	require("treesj").setup({
		use_default_keymaps = false,
	})
end

return M

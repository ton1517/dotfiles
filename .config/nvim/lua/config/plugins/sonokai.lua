local M = {}

M.setup = function() end

M.config = function()
	vim.g.sonokai_style = "default"
	vim.g.sonokai_disable_italic_comment = 1
	vim.g.sonokai_diagnostic_text_highlight = 1
	vim.g.sonokai_diagnostic_virtual_text = "colored"
	vim.g.sonokai_current_word = "underline"
	vim.g.sonokai_better_performance = 1

	vim.cmd([[colorscheme sonokai]])
end

return M

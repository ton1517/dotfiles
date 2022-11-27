local M = {}

M.setup = function() end

M.config = function()
	vim.g.everforest_background = "hard"
	vim.g.everforest_better_performance = 1
	vim.g.everforest_disable_italic_comment = 1
	vim.g.everforest_diagnostic_text_highlight = 1
	vim.g.everforest_diagnostic_line_highlight = 1
	vim.g.everforest_diagnostic_virtual_text = 1
	vim.g.everforest_current_word = "underline"

	vim.cmd([[colorscheme everforest]])
end

return M

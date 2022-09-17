local M = {}

M.setup = function() end

M.config = function()
	vim.keymap.set("n", "<buffer><C-l>", "<Plug>(auto_git_diff_scroll_manual_update)")
	vim.keymap.set("n", "<buffer><C-n>", "<Plug>(auto_git_diff_scroll_down_half)")
	vim.keymap.set("n", "<buffer><C-p>", "<Plug>(auto_git_diff_scroll_up_half)")
end

return M

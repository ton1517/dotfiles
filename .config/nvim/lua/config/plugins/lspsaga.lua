local M = {}

M.setup = function() end

M.config = function()
	local keymap = vim.keymap.set
	local opts = { silent = true }
	keymap("n", ",e", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	keymap("n", ",rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap({ "n", "v" }, ",ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	keymap("n", ",o", "<cmd>LSoutlineToggle<CR>", opts)

	require("lspsaga").init_lsp_saga({
		symbol_in_winbar = {
			enable = true,
		},
		code_action_icon = " ",
		finder_action_keys = {
			open = "<CR>",
			vsplit = "s",
			split = "i",
			quit = "<ESC>",
		},
		code_action_keys = {
			quit = "<ESC>",
			exec = "<CR>",
		},
		rename_action_quit = "<ESC>",
	})
end

return M

return {
	-- light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
	"glepnir/lspsaga.nvim",
	dependencies = { "folke/lsp-colors.nvim" },

	config = function()
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
			finder_request_timeout = 15000,
			symbol_in_winbar = {
				enable = false,
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
	end,
}

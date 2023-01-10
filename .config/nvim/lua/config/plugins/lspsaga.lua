return {
	-- light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
	"glepnir/lspsaga.nvim",
	branch = "version_2.3",

	config = function()
		local keymap = vim.keymap.set
		local opts = { silent = true }

		-- keymap("n", ",rn", "<cmd>Lspsaga rename<CR>", opts)
		keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
		-- keymap({ "n", "v" }, ",ca", "<cmd>Lspsaga code_action<CR>", opts)
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

return {
	-- light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
	"nvimdev/lspsaga.nvim",
	event = { "LspAttach" },
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},

	config = function()
		local keymap = vim.keymap.set
		local opts = { silent = true }
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
		keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)

		keymap("n", "gh", "<cmd>Lspsaga finder<CR>", opts)
		keymap({ "n", "v" }, ",ca", "<cmd>Lspsaga code_action<CR>", opts)
		keymap("n", ",o", "<cmd>Lspsaga outline<CR>", opts)

		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = false,
			},
			finder = {
				keys = {
					vsplit = "v",
					split = "s",
				},
			},
			code_action = {
				num_shortcut = true,
				show_server_name = true,
			},
			rename = {
				quit = "<ESC>",
			},
			ui = {
				border = "rounded",
				code_action = " ",
			},
		})
	end,
}

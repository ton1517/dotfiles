return {
	-- light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
	"glepnir/lspsaga.nvim",
	event = { "LspAttach" },

	config = function()
		local keymap = vim.keymap.set
		local opts = { silent = true }
		keymap("n", ",e", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
		keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		keymap("n", "[E", function()
			require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		keymap("n", "]E", function()
			require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)

		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
		keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)

		keymap("n", ",rn", "<cmd>Lspsaga rename<CR>", opts)
		keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
		keymap({ "n", "v" }, ",ca", "<cmd>Lspsaga code_action<CR>", opts)
		keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		keymap("n", ",o", "<cmd>Lspsaga outline<CR>", opts)

		require("lspsaga").setup({
			request_timeout = 15000,
			symbol_in_winbar = {
				enable = false,
			},
			finder = {
				edit = { "o", "<CR>" },
				vsplit = "v",
				split = "s",
				tabe = "t",
				quit = { "q", "<ESC>" },
			},
			code_action = {
				num_shortcut = true,
				keys = {
					quit = { "q", "<ESC>" },
					exec = "<CR>",
				},
			},
			rename = {
				quit = "<ESC>",
			},
			ui = {
				border = "rounded",
				code_action = " ",
				diagnostic = " ",
			},
		})
	end,
}

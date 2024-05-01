return {
	-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			diagnostics_format = "#{m} (#{s}: #{c})",
			sources = {
				-- see https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				-- Code Actions
				-- null_ls.builtins.code_actions.gitsigns,

				-- Diagnostics
				null_ls.builtins.diagnostics.actionlint,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.codespell,
				require("none-ls.diagnostics.flake8"),
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.has_file({ ".eslintrc.json", ".eslintrc.js", ".eslint.config.js" })
					end,
				}),
			},
		})
	end,
}

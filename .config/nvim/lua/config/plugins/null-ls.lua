return {
	-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								return client.name ~= "tsserver"
							end,
							bufnr = bufnr,
							timeout_ms = 3000,
						})
					end,
					once = false,
				})
			end
		end

		null_ls.setup({
			diagnostics_format = "#{m} (#{s}: #{c})",
			sources = {
				-- see https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				-- Code Actions
				-- null_ls.builtins.code_actions.gitsigns,

				-- Diagnostics
				null_ls.builtins.diagnostics.actionlint,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.flake8,
				null_ls.builtins.diagnostics.eslint_d,

				-- Formatting
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.dart_format,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.jq,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.formatting.prettierd.with({
					condition = function(utils)
						return utils.has_file({ ".prettierrc", ".prettierrc.js" })
					end,
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.yamlfmt,
				null_ls.builtins.formatting.black,
			},
			on_attach = on_attach,
		})
	end,
}

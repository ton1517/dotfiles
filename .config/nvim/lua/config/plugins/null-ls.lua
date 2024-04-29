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
		local methods = require("null-ls.methods")
		local h = require("null-ls.helpers")
		local u = require("null-ls.utils")
		local cmd_resolver = require("null-ls.helpers.command_resolver")

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

				-- Formatting
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.dart_format,
				null_ls.builtins.formatting.goimports,
				require("none-ls.formatting.jq").with({
					condition = function(utils)
						return utils.has_file({ "biome.json", "biome.jsonc" }) == false
					end,
				}),
				require("none-ls.formatting.eslint_d").with({
					condition = function(utils)
						return utils.has_file({ ".eslintrc.json", ".eslintrc.js", ".eslint.config.js" })
					end,
				}),
				null_ls.builtins.formatting.prettierd.with({
					condition = function(utils)
						return utils.has_file({ ".prettierrc", ".prettierrc.js" })
					end,
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.yamlfmt,
				null_ls.builtins.formatting.black,
				h.make_builtin({
					name = "biome",
					method = methods.internal.FORMATTING,
					filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
					generator_opts = {
						command = "biome",
						args = {
							"check",
							"--apply",
							"--skip-errors",
							"--linter-enabled",
							"false",
							"--stdin-file-path",
							"$FILENAME",
						},
						dynamic_command = cmd_resolver.from_node_modules(),
						cwd = h.cache.by_bufnr(function(params)
							return u.root_pattern("rome.json", "biome.json", "biome.jsonc")(params.bufname)
						end),
						to_stdin = true,
						condition = function(utils)
							return utils.has_file({ "biome.json", "biome.jsonc" })
						end,
					},
					factory = h.formatter_factory,
				}),
			},
		})
	end,
}

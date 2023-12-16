return {
	-- Quickstart configs for Nvim LSP
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local keymap = vim.keymap.set
		local opt = { noremap = true, silent = true }

		keymap("n", ",e", vim.diagnostic.open_float, opt)
		keymap("n", "[e", vim.diagnostic.goto_prev, opt)
		keymap("n", "]e", vim.diagnostic.goto_next, opt)
		keymap("n", "[E", function()
			vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end)
		keymap("n", "]E", function()
			vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
		end)

		keymap("n", "gy", vim.lsp.buf.type_definition, opt)
		keymap("n", "gr", vim.lsp.buf.references, opt)
		keymap("n", "gi", vim.lsp.buf.implementation, opt)

		keymap("n", "K", vim.lsp.buf.hover, opt)
		keymap("n", ",rn", vim.lsp.buf.rename, opt)

		keymap("n", ",wa", vim.lsp.buf.add_workspace_folder, opt)
		keymap("n", ",wr", vim.lsp.buf.remove_workspace_folder, opt)
		keymap("n", ",wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opt)

		keymap("n", "<S-f>", function()
			vim.lsp.buf.format({
				filter = function(client)
					return client.name ~= "tsserver"
				end,
				async = true,
				timeout_ms = 3000,
			})
		end, opt)

		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

			require("lsp_signature").on_attach({
				bind = true,
				floating_window = false,
				toggle_key = "<C-k>",
				hint_prefix = " ",
			}, bufnr)

			require("lsp-inlayhints").on_attach(client, bufnr)
		end
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				require("neodev").setup({})
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							format = {
								enable = false,
							},
						},
					},
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			["tsserver"] = function()
				require("typescript").setup({
					server = {
						init_options = {
							tsserver = {
								path = require("mason.settings").current.install_root_dir
									.. "/packages/typescript-language-server/node_modules/typescript/lib/",
							},
							preferences = {
								includeCompletionsForModuleExports = false,
								includeCompletionsWithSnippetText = false,
								-- includeInlayParameterNameHints = "all",
								-- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								-- includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayVariableTypeHintsWhenTypeMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						on_attach = on_attach,
						capabilities = capabilities,
					},
				})
			end,

			["eslint"] = function()
				require("lspconfig")["eslint"].setup({
					on_attach = function(client, bufnr)
						on_attach(client, bufnr)
						client.server_capabilities.documentFormattingProvider = true
					end,
					capabilities = capabilities,
				})
			end,
		})
	end,
}

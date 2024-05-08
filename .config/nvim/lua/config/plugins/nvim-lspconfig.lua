return {
	-- Quickstart configs for Nvim LSP
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- A Neovim plugin that provides the SchemaStore catalog for use with jsonls and yamlls.
		"b0o/schemastore.nvim",
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
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
						capabilities = capabilities,
					},
				})
			end,

			["jsonls"] = function()
				require("lspconfig").jsonls.setup({
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
					capabilities = capabilities,
				})
			end,

			["yamlls"] = function()
				require("lspconfig").yamlls.setup({
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
					capabilities = capabilities,
				})
			end,
		})
	end,
}

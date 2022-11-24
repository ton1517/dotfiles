local M = {}

M.setup = function() end

M.config = function()
	local keymap = vim.keymap.set
	local opt = { noremap = true, silent = true }
	keymap("n", "gd", vim.lsp.buf.definition, opt)
	keymap("n", "gy", vim.lsp.buf.type_definition, opt)
	keymap("n", "gD", vim.lsp.buf.declaration, opt)
	keymap("n", "gr", vim.lsp.buf.references, opt)
	keymap("n", "gi", vim.lsp.buf.implementation, opt)

	keymap("n", ",wa", vim.lsp.buf.add_workspace_folder, opt)
	keymap("n", ",wr", vim.lsp.buf.remove_workspace_folder, opt)
	keymap("n", ",wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opt)

	keymap("n", "<S-f>", function()
		vim.lsp.buf.format({ async = true })
	end, opt)

	local on_attach = function(_, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
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

		["sumneko_lua"] = function()
			require("neodev").setup({})
			require("lspconfig").sumneko_lua.setup({
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
			require("lspconfig")["tsserver"].setup({})
			require("typescript").setup({
				server = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
			})
		end,
	})
end

return M

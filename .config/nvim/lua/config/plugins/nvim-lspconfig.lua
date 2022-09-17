local M = {}

M.setup = function() end

M.config = function()
	local keymap = vim.keymap.set
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	keymap("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")

	keymap("n", ",wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	keymap("n", ",wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	keymap("n", ",wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

	keymap("n", "<S-f>", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")

	local on_attach = function(_, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	end

	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup_handlers({
		function(server_name)
			local opts = { on_attach = on_attach, capabilities = capabilities }

			if server_name == "sumneko_lua" then
				opts.settings = {
					Lua = {
						format = {
							enable = false,
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				}
			end

			require("lspconfig")[server_name].setup(opts)
		end,
	})
end

return M

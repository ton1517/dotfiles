local M = {}

M.setup = function()
	local group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	vim.api.nvim_create_autocmd("LspAttach", {
		group = group,
		callback = function(args)
			if not (args.data and args.data.client_id) then
				return
			end

			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			require("lsp-inlayhints").on_attach(client, bufnr)
		end,
	})
end

M.config = function()
	require("lsp-inlayhints").setup({})
end

return M

local M = {}

--- Create a new LspAttach autocommand.
--- @param on_attach function(client: vim.lsp.Client|nil, bufnr: number): void
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			if not (args.data and args.data.client_id) then
				return
			end
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local bufnr = args.buf
			on_attach(client, bufnr)
		end,
	})
end

return M

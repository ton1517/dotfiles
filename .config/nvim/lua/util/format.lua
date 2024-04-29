local ms = require("vim.lsp.protocol").Methods

local M = {}

--- whether to format on save
--- @type boolean
M.formats_on_save = true

--- timeout in milliseconds
--- @type number
M.timeout_ms = 3000

--- exclude clients from formatting
--- @type string[]
M.exclude = {}

--- format bia LSP
--- @param opts? {client_name?: string, force?:boolean, async?:boolean}
function M.format(opts)
	if opts and not opts.force and not M.formats_on_save then
		return
	end

	local clients = nil
	if opts and opts.client_name then
		clients = vim.lsp.get_clients({
			bufnr = vim.api.nvim_get_current_buf(),
			method = ms.textDocument_formatting,
			name = opts.client_name,
		})
	else
		clients = vim.lsp.get_clients({
			bufnr = vim.api.nvim_get_current_buf(),
			method = ms.textDocument_formatting,
		})
	end

	if #clients == 0 then
		return
	end

	for _, client in ipairs(clients) do
		local excluded = vim.tbl_contains(M.exclude, client.name)
		if excluded then
			goto continue
		end

		if client.supports_method(ms.textDocument_formatting) then
			vim.lsp.buf.format({
				name = client.name,
				async = opts and opts.async or false,
				timeout_ms = M.timeout_ms,
			})
		end
		::continue::
	end
end

--- enable format on save
function M.enable()
	M.formats_on_save = true

	vim.notify("Enabled format on save", vim.log.levels.INFO)
end

-- disable format on save
function M.disable()
	M.formats_on_save = false

	vim.notify("Disabled format on save", vim.log.levels.INFO)
end

--- setup format on save
--- @param opts {timeout_ms?:number, exclude?:string[]}
function M.setup(opts)
	M.timeout_ms = opts and opts.timeout_ms or M.timeout_ms
	M.exclude = opts and opts.exclude or M.exclude

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	require("util.lsp").on_attach(function(client, bufnr)
		local excluded = vim.tbl_contains(M.exclude, client.name)
		if excluded then
			return
		end
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				M.format({ client_name = client.name })
			end,
		})
	end)
end

return M

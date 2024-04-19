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
--- @param opts? {force?:boolean, async?:boolean, timeout_ms?:number}
function M.format(opts)
	if opts and not opts.force and not M.formats_on_save then
		return
	end

	vim.lsp.buf.format({
		filter = function(client)
			local supports_format = client.supports_method("textDocument/formatting")
			local excluded = vim.tbl_contains(M.exclude, client.name)

			return supports_format and not excluded
		end,
		async = (opts and opts.async) or false,
		timeout_ms = (opts and opts.timeout_ms) or M.timeout_ms,
	})
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
	require("util.lsp").on_attach(function(_, bufnr)
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = M.format,
		})
	end)
end

return M

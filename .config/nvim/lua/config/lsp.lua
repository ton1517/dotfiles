-- LSP keymap

local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }

keymap({ "n", "v" }, "<S-f>", ":Format<CR>", opt)

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

keymap("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, opt)

-- LSP style config

local border_style = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border_style,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border_style,
})

vim.diagnostic.config({
	severity_sort = true,
	float = {
		border = border_style,
	},
	virtual_text = {
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

------------------------------
-- Language config
------------------------------

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure default capabilities for all servers
vim.lsp.config("*", {
	capabilities = capabilities,
})

-- vtsls configuration
vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
					entriesLimit = 10,
				},
			},
		},
		typescript = {
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			tsserver = {
				maxTsServerMemory = 8192,
				-- log = "terse",
			},
		},
	},
	on_attach = function()
		-- Setup vtsls specific configurations if needed
		if not require("lspconfig.configs").vtsls then
			require("lspconfig.configs").vtsls = require("vtsls").lspconfig
		end
	end,
})

-- jsonls configuration
vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- yamlls configuration
vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})

-- rust_analyzer handled by rustaceanvim
vim.lsp.config("rust_analyzer", {
	-- Minimal config, actual setup is handled by rustaceanvim
})

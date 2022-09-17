local M = {}

M.setup = function() end

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			-- LSP
			"clangd",
			"gopls",
			"graphql-language-service-cli",
			"dockerfile-language-server",
			"html-lsp",
			"json-lsp",
			"typescript-language-server",
			"taplo",
			"terraform-ls",
			"tflint",
			"css-lsp",
			"yaml-language-server",
			"bash-language-server",
			"lua-language-server",
			"eslint-lsp",
			"stylelint-lsp",

			-- Linter
			"actionlint",
			"luacheck",
			"golangci-lint",
			"markdownlint",
			"shellcheck",

			-- Formatter
			"luaformatter",
			"yamlfmt",
			"goimports",
			"prettier",
			"stylua",
		},
	})
end

return M

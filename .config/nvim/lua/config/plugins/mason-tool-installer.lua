local M = {}

M.setup = function() end

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			-- LSP
			"clangd",
			"gopls",
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
			"prisma-language-server",

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

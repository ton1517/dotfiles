return {
	-- Install and upgrade third party tools automatically
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	cmd = "MasonToolsInstall",

	config = function()
		require("mason-tool-installer").setup({
			run_on_start = false,
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
				-- "stylelint-lsp",
				"prisma-language-server",

				-- Linter
				"actionlint",
				"luacheck",
				"golangci-lint",
				"markdownlint",
				"shellcheck",
				"codespell",

				-- Formatter
				"luaformatter",
				"yamlfmt",
				"goimports",
				"prettier",
				"stylua",
			},
		})
	end,
}

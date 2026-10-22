return {
	-- Install and upgrade third party tools automatically
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	cmd = "MasonToolsInstall",

	config = function()
		require("mason-tool-installer").setup({
			run_on_start = false,
			ensure_installed = {
				-- LSP
				"biome",
				"clangd",
				"gopls",
				"dockerfile-language-server",
				"html-lsp",
				"json-lsp",
				"vtsls",
				"taplo",
				"terraform-ls",
				"tflint",
				"css-lsp",
				"bash-language-server",
				"lua-language-server",
				"eslint_d",
				"yaml-language-server",
				-- "stylelint-lsp",
				"prisma-language-server",

				-- Linter
				"actionlint",
				"golangci-lint",
				"codespell",
				"flake8",

				-- Formatter
				"goimports",
				"prettierd",
				"stylua",
				"black",
			},
		})
	end,
}

return {
	-- Speed up loading Lua modules in Neovim to improve startup time.
	"lewis6991/impatient.nvim",
	-- GitHub extension for fugitive.vim
	"tpope/vim-rhubarb",
	-- enable repeating supported plugin maps with "."
	"tpope/vim-repeat",
	-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
	"andymass/vim-matchup",
	-- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
	{ "RRethy/vim-illuminate", event = "BufReadPost" },
	-- Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
	"folke/lsp-colors.nvim",
	-- Vim plugin for working with python virtualenvs
	{ "jmcantrell/vim-virtualenv", ft = { "python", "python3" } },
	-- Rainbow parentheses for neovim using tree-sitter.
	{ "p00f/nvim-ts-rainbow", dependencies = { "nvim-treesitter/nvim-treesitter" }, event = "BufRead" },
	-- More Pleasant Editing on Commit Message
	{ "rhysd/committia.vim", ft = "gitcommit" },

	-- A minimal typescript-language-server integration plugin to set up the language server via nvim-lspconfig and add commands for convenience.
	{ "jose-elias-alvarez/typescript.nvim", lazy = true },
	-- Dev init for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	{ "folke/neodev.nvim", lazy = true },
	-- Generate JSDoc to your JavaScript code.
	{ "heavenshell/vim-jsdoc", build = "make install" },
}

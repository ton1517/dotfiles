return {
	-- Treesitter configurations and abstraction layer for Neovim.
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"cpp",
				"css",
				"dart",
				"dockerfile",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gowork",
				"graphql",
				"hcl",
				"html",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"kotlin",
				"lua",
				"make",
				"markdown",
				"php",
				"python",
				"prisma",
				"ruby",
				"rust",
				"scss",
				"swift",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}

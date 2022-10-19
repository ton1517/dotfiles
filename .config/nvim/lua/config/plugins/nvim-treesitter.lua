local M = {}

M.setup = function() end

M.config = function()
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
end

return M

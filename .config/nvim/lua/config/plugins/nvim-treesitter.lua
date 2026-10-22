return {
	-- Treesitter configurations and abstraction layer for Neovim.
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		-- パーサーのインストール (インストール済みなら何もしない)
		-- ビルドに tree-sitter CLI が必要
		require("nvim-treesitter").install({
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
			"kotlin",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"php",
			"pkl",
			"prisma",
			"python",
			"ruby",
			"rust",
			"scss",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
		})

		-- ハイライト・インデントは自動では有効にならないため、FileTypeごとに有効にする
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TreesitterStart", {}),
			callback = function(args)
				-- パーサーがないfiletypeでは何もしない
				if not pcall(vim.treesitter.start, args.buf) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}

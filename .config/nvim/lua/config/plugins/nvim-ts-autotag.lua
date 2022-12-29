return {
	-- Use treesitter to auto close and auto rename html tag
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = {
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		"tsx",
		"jsx",
		"rescript",
		"xml",
	},

	config = function()
		require("nvim-ts-autotag").setup()
	end,
}

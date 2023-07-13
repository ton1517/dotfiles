return {
	"hiphish/rainbow-delimiters.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",

	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"rainbowcol1",
				"rainbowcol2",
				"rainbowcol3",
				"rainbowcol4",
				"rainbowcol5",
				"rainbowcol6",
				"rainbowcol7",
			},
		}
	end,
}

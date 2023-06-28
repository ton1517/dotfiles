return {
	"folke/flash.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {},
	keys = {
		{
			"<space>",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}

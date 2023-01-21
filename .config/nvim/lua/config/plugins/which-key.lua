return {
	-- displays a popup with possible key bindings of the command you started typing.
	"folke/which-key.nvim",
	event = "VeryLazy",

	config = function()
		require("which-key").setup({})
	end,
}

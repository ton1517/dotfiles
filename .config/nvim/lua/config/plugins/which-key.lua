return {
	-- displays a popup with possible key bindings of the command you started typing.
	"folke/which-key.nvim",

	config = function()
		require("which-key").setup({})
	end,
}

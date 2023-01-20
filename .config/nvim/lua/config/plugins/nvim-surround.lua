return {
	-- Add/change/delete surrounding delimiter pairs with ease.
	"kylechui/nvim-surround",
	event = { "ModeChanged" },

	config = function()
		require("nvim-surround").setup({})
	end,
}

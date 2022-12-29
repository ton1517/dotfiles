return {
	-- The fastest Neovim colorizer.
	"norcalli/nvim-colorizer.lua",

	config = function()
		require("colorizer").setup()
	end,
}

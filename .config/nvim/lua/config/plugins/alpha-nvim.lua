return {
	-- alpha is a fast and fully programmable greeter for neovim.
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}

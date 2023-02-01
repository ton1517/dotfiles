return {
	-- A super powerful autopair plugin for Neovim that supports multiple characters.
	"windwp/nvim-autopairs",
	event = "InsertEnter",

	config = function()
		require("nvim-autopairs").setup({
			fast_wrap = {
				map = "<C-]>",
			},
		})
	end,
}

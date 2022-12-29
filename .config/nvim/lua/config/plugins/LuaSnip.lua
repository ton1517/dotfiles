return {
	-- Snippet Engine for Neovim written in Lua.
	"L3MON4D3/LuaSnip",
	dependencies = {
		-- Snippets collection for a set of different programming languages for faster development.
		"rafamadriz/friendly-snippets",
	},
	event = "BufReadPost",

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}

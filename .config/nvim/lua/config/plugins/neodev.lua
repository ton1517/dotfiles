return {
	-- Dev init for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	"folke/neodev.nvim",
	lazy = true,

	config = function()
		require("neodev").setup({
			library = { plugins = { "neotest" }, types = true },
		})
	end,
}

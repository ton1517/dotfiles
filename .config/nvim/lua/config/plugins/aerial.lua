return {
	-- A code outline window for skimming and quick navigation
	"stevearc/aerial.nvim",
	lazy = true,

	config = function()
		require("aerial").setup()
	end,
}

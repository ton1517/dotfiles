return {
	-- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
	"j-hui/fidget.nvim",

	config = function()
		require("fidget").setup({})
	end,
}

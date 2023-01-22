return {
	-- Partial implementation of LSP inlay hint.
	"lvimuser/lsp-inlayhints.nvim",
	lazy = true,

	config = function()
		require("lsp-inlayhints").setup({
			inlay_hints = {
				parameter_hints = {
					show = false,
				},
			},
		})
	end,
}

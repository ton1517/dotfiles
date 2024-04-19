return {
	-- Partial implementation of LSP inlay hint.
	"lvimuser/lsp-inlayhints.nvim",
	lazy = true,

	init = function()
		require("util.lsp").on_attach(function(client, bufnr)
			require("lsp-inlayhints").on_attach(client, bufnr)
		end)
	end,
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

return {
	-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	"mason-org/mason-lspconfig.nvim",
	event = "VeryLazy",

	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},

	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = {
					-- フォーマットは conform.nvim で行うため、LSPとしては起動しない
					"stylua",
				},
			},
		})
	end,
}

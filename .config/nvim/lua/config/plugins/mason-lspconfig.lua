return {
	-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	"mason-org/mason-lspconfig.nvim",
	event = "VeryLazy",

	dependencies = { "mason-org/mason.nvim" },

	config = function()
		require("mason-lspconfig").setup({})
	end,
}

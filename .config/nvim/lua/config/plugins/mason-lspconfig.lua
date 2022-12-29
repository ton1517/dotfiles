return {
	-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },

	config = function()
		require("mason-lspconfig").setup({})
	end,
}

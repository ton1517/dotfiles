return {
	-- LSP signature hint as you type
	"ray-x/lsp_signature.nvim",

	config = function()
		require("lsp_signature").setup({
			floating_window = false,
			toggle_key = "<C-k>",
			hint_prefix = " ",
		})
	end,
}

return {
	-- LSP signature hint as you type
	"ray-x/lsp_signature.nvim",
	lazy = true,

	init = function()
		require("util.lsp").on_attach(function(_, bufnr)
			require("lsp_signature").on_attach({
				bind = true,
				floating_window = false,
				toggle_key = "<C-k>",
				hint_prefix = " ",
			}, bufnr)
		end)
	end,
}

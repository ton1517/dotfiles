return {
	-- Pkl language support for Neovim
	"apple/pkl-neovim",
	ft = "pkl",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.g.pkl_neovim = {
			start_command = { "pkl-lsp" },
			pkl_cli_path = "pkl",
		}
		require("pkl-neovim").init()
	end,
}

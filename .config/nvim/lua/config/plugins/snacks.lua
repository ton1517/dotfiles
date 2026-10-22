return {
	-- A collection of QoL plugins for Neovim
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		-- vim.ui.input を置き換える (dressing.nvim の後継)
		input = { enabled = true },
		-- vim.ui.select を置き換える (dressing.nvim の後継)
		picker = {
			enabled = true,
			ui_select = true,
		},
	},

	keys = {
		-- ウィンドウレイアウトを崩さずにバッファを削除する (bufdelete.nvim の後継)
		{
			"bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete buffer",
		},
	},
}

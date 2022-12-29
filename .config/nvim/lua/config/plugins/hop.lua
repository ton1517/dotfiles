return {
	-- EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
	"phaazon/hop.nvim",
	cmd = { "HopWord", "HopChar2" },

	init = function()
		vim.keymap.set("n", "<Leader>e", ":HopWord<cr>")
		vim.keymap.set("n", "<Leader>s", ":HopChar2<cr>")
	end,

	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}

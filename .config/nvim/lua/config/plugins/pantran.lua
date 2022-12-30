return {
	"potamides/pantran.nvim",

	init = function()
		vim.keymap.set({ "n", "v" }, ",tr", function()
			return require("pantran").motion_translate({ target = "ja" })
		end, { noremap = true, silent = true, expr = true })
	end,

	config = function()
		require("pantran").setup({
			default_engine = "google",
			default_target = "ja",
		})
	end,
}

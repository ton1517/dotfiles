return {
	"dmmulroy/ts-error-translator.nvim",
	ft = {
		"typescript",
		"typescriptreact",
		"tsx",
	},

	config = function()
		require("ts-error-translator").setup()
	end,
}

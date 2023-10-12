return {
	-- This plugin adds indentation guides to all lines (including empty lines).
	"lukas-reineke/indent-blankline.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	main = "ibl",

	config = function()
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "ScopeHighlight", { fg = "#7fbbb3" })
		end)

		require("ibl").setup({
			scope = {
				char = "║",
				highlight = "ScopeHighlight",
			},
		})
	end,
}

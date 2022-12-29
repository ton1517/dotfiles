return {
	-- Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
	"terryma/vim-expand-region",
	keys = {
		{ "<Plug>(expand_region", mode = "v" },
	},

	init = function()
		vim.keymap.set("v", "v", "<Plug>(expand_region_expand)")
		vim.keymap.set("v", "<C-v>", "<Plug>(expand_region_shrink)")
	end,
}

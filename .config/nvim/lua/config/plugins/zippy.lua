return {
	-- nvim plugin written in lua to help with debugging.
	"PatschD/zippy.nvim",
	lazy = true,

	init = function()
		vim.keymap.set("n", "<leader>lg", "<cmd>lua require('zippy').insert_print()<CR>")
	end,
}

return {
	-- Improved Yank and Put functionalities for Neovim
	"gbprod/yanky.nvim",
	event = "BufReadPost",

	config = function()
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
		vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
		vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
		vim.keymap.set("n", "<C-n>", "<Plug>(YankyCycleForward)")
		vim.keymap.set("n", "<C-p>", "<Plug>(YankyCycleBackward)")

		require("yanky").setup({
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 100,
			},
			preserve_cursor_position = {
				enabled = true,
			},
		})
	end,
}

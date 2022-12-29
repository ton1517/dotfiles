return {
	-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "TroubleToggle",

	init = function()
		vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
		vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
		vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
		vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
		vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
		vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")
	end,
}

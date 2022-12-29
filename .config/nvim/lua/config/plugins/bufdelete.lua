return {
	-- Delete Neovim buffers without losing window layout
	"famiu/bufdelete.nvim",
	cmd = "Bdelete",

	init = function()
		vim.keymap.set("n", "bd", ":Bdelete<cr>")
	end,
}

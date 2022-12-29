return {
	-- A Vim plugin to visualizes the Vim undo tree.
	"simnalamburt/vim-mundo",
	cmd = "MundoToggle",

	init = function()
		vim.keymap.set("n", ",mu", ":MundoToggle<CR>")
	end,
}

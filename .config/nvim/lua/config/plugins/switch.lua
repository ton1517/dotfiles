return {
	-- A simple Vim plugin to switch segments of text with predefined replacements
	"AndrewRadev/switch.vim",
	cmd = "Switch",

	init = function()
		vim.keymap.set("n", "-", ":Switch<cr>")
	end,
}

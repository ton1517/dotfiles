local M = {}

M.setup = function() end

M.config = function()
	local keymap = vim.keymap.set
	keymap("n", ",Fa", ":FlutterRun --debug --dart-define=FLAVOR=development<cr>")
	keymap("n", ",Fq", ":FlutterQuit<cr>")
	keymap("n", ",Fr", ":FlutterReload<cr>")
	keymap("n", ",FR", ":FlutterRestart<cr>")
	keymap("n", ",Fo", ":FlutterOutlineToggle<cr>")

	require("flutter-tools").setup({})
end

return M

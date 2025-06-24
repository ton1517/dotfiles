-- my config
require("config.disable-standard-plugins")
require("config.keymap")
require("config.option")
require("config.lazy")

if vim.g.vscode then
	require("config.vscode-keymap")
else
	require("config.lsp")
	pcall(require, "config.local")
end


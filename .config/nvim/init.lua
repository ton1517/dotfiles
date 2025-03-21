-- my config
require("config.disable-standard-plugins")
require("config.keymap")
require("config.option")

if vim.g.vscode then
	require("config.vscode-keymap")
else
	require("config.lsp")
	pcall(require, "config.local")
end

require("config.lazy")

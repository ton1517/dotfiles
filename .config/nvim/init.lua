-- my config
require("config.disable-standard-plugins")
require("config.keymap")
require("config.option")
require("config.lsp-diagnostic-option")
pcall(require, "config.local")

require("config.lazy")

-- my config
require("config.disable-standard-plugins")
require("config.keymap")
require("config.option")
pcall(require, "config.local")

require("config.lazy")

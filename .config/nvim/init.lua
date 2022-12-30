-- Speed up loading Lua modules in Neovim to improve startup time.
-- https://github.com/lewis6991/impatient.nvim
-- :LuaCacheClear
-- :LuaCacheLog
-- :LuaCacheProfile
pcall(require, "impatient")

-- my config
require("config.disable-standard-plugins")
require("config.keymap")
require("config.option")
pcall(require, "config.local")

require("config.lazy")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local create_cmd = vim.api.nvim_create_user_command
local cmd = vim.cmd

-- ----------------------------------------------------------------------
-- --                              packer                              --
-- ----------------------------------------------------------------------
-- autocmd("BufWritePost", {
-- 	group = augroup("packer_user_config", { clear = true }),
-- 	pattern = "plugins.lua",
-- 	command = "source " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/config/packer/init.lua" .. " | PackerSync",
-- })
--
-- create_cmd("PackerInstall", function()
-- 	cmd([[packadd packer.nvim]])
-- 	require("config.packer").install()
-- end, {})
-- create_cmd("PackerUpdate", function()
-- 	cmd([[packadd packer.nvim]])
-- 	require("config.packer").update()
-- end, {})
-- create_cmd("PackerSync", function()
-- 	cmd([[packadd packer.nvim]])
-- 	require("config.packer").sync()
-- end, {})
-- create_cmd("PackerClean", function()
-- 	cmd([[packadd packer.nvim]])
-- 	require("config.packer").clean()
-- end, {})
-- create_cmd("PackerCompile", function()
-- 	cmd([[packadd packer.nvim]])
-- 	require("config.packer").compile()
-- end, {})
-- create_cmd("PackerStatus", function()
-- 	cmd([[packadd packer.nvim]])
-- 	require("config.packer").status()
-- end, {})

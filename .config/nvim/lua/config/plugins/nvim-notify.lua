return {
	-- A fancy, configurable, notification manager for NeoVim
	"rcarriga/nvim-notify",

	config = function()
		vim.notify = require("notify")
	end,
}

local M = {}

M.setup = function()
	local opt = { silent = true }
	vim.keymap.set("n", "<leader>r", function()
		require("sniprun").run("w")
	end, opt)
	vim.keymap.set("v", "<leader>r", function()
		require("sniprun").run("v")
	end, opt)
	vim.keymap.set("n", "<leader>R", function()
		require("sniprun.display").close_all()
	end, opt)
end

M.config = function()
	require("sniprun").setup({
		display = {
			"NvimNotify",
		},

		display_options = {
			notification_timeout = 10000,
		},
	})
end

return M

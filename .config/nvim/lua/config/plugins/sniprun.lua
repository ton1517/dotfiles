return {
	-- Sniprun is a code runner plugin for neovim written in Lua and Rust.
	"michaelb/sniprun",
	build = "bash ./install.sh",
	lazy = true,

	init = function()
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
	end,

	config = function()
		require("sniprun").setup({
			display = {
				"NvimNotify",
			},

			display_options = {
				notification_timeout = 10000,
			},
		})
	end,
}

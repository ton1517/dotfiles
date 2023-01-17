return {
	-- About Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
	"zbirenbaum/copilot.lua",
	event = "VimEnter",

	config = function()
		vim.defer_fn(function()
			require("copilot").setup({
				panel = {
					enabled = false,
				},
				suggestion = {
					enabled = false,
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/18.12.1/bin/node",
				server_opts_overrides = {},
			})
		end, 100)
	end,
}

local M = {}

M.setup = function() end

M.config = function()
	local keymap = vim.keymap.set
	keymap("n", ",ff", "<cmd>Telescope find_files find_command=rg,--no-ignore-dot,--hidden,-g,!.git/,--files<cr>")
	keymap("n", ",fo", "<cmd>Telescope oldfiles<cr>")
	keymap("n", ",fg", "<cmd>Telescope live_grep<cr>")
	keymap("n", ",fG", "<cmd>Telescope grep_string<cr>")
	keymap("n", ",fb", "<cmd>Telescope buffers<cr>")
	keymap("n", ",fh", "<cmd>Telescope help_tags<cr>")
	keymap("n", ",fc", "<cmd>Telescope command_history<cr>")
	keymap("n", ",fk", "<cmd>Telescope keymaps<cr>")
	keymap("n", ",fn", "<cmd>Telescope notify<cr>")
	keymap("n", ",<C-g><C-s>", "<cmd>Telescope git_status<cr>")
	keymap("n", ",fe", function()
		require("telescope").extensions.gitmoji.gitmoji()
	end)
	keymap("n", ",fp", function()
		vim.cmd([[packadd packer.nvim]])
		require("config.packer")
		require("telescope").load_extension("packer")
		require("telescope").extensions.packer.packer()
	end)
	keymap({ "n", "v" }, ",fr", function()
		require("refactoring")
		require("telescope").extensions.refactoring.refactors()
	end)

	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--no-ignore-dot",
				"--hidden",
				"-g=!.git/",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			mappings = {
				i = {
					["<esc>"] = actions.close,
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["<C-c>"] = actions.close,
					["q"] = actions.close,
				},
			},
		},
		extensions = {
			gitmoji = {
				action = function(entry)
					-- entry = {
					--     display = "🎨 Improve structure / format of the code.",
					--     index = 1,
					--     ordinal = "Improve structure / format of the code.",
					--     value = "🎨"
					-- }
					local pos = vim.api.nvim_win_get_cursor(0)
					vim.api.nvim_buf_set_text(0, 0, 0, 0, 0, { entry.value .. " " })
				end,
			},
		},
	})
end

return M

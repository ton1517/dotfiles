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
	keymap("n", ",<C-g><C-s>", "<cmd>Telescope git_status<cr>")
	keymap("n", ",fp", function()
		vim.cmd([[packadd packer.nvim]])
		require("config.packer")
		require("telescope").load_extension("packer")
		require("telescope").extensions.packer.packer()
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
	})
end

return M

return {
	-- a highly extendable fuzzy finder over lists.
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- FZF sorter for telescope written in c
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- Telescope extension that provides handy functionality about plugins installed via lazy.nvim.
		"tsakirist/telescope-lazy.nvim",
		-- -- A Telescope integration of gitmoji.
		"olacin/telescope-gitmoji.nvim",
		"gbprod/yanky.nvim",
	},
	lazy = true,
	cmd = { "Telescope" },

	init = function()
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
		keymap("n", ",fy", "<cmd>Telescope yank_history<cr>")
		keymap("n", "<C-g><C-s>", "<cmd>Telescope git_status<cr>")
		keymap("n", ",fe", function()
			require("telescope").extensions.gitmoji.gitmoji()
		end, { desc = "Telescope gitmoji" })
		keymap("n", ",fp", "<cmd>Telescope lazy<cr>")
		keymap({ "n", "v" }, ",fr", function()
			require("refactoring")
			require("telescope").extensions.refactoring.refactors()
		end, { desc = "Telescope refactoring" })
		keymap("n", ",fa", function()
			require("telescope").extensions.aerial.aerial()
		end, { desc = "Telescope aerial" })
	end,

	config = function()
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
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				gitmoji = {
					action = function(entry)
						vim.api.nvim_buf_set_text(0, 0, 0, 0, 0, { entry.value .. " " })
					end,
				},
				lazy = {
					-- Whether or not to show the icon in the first column
					show_icon = true,
					-- Mappings for the actions
					mappings = {
						open_in_browser = "<C-o>",
						open_in_find_files = "<C-f>",
						open_in_live_grep = "<C-g>",
						open_plugins_picker = "<C-b>", -- Works only after having called first open_in_find_files or open_in_live_grep
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("lazy")
		require("telescope").load_extension("yank_history")
		require("telescope").load_extension("notify")
	end,
}

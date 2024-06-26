return {
	-- An extensible framework for interacting with tests within NeoVim.
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"haydenmeade/neotest-jest",
		"mrcjkb/rustaceanvim",
	},
	lazy = true,

	init = function()
		local keymap = vim.keymap.set

		keymap("n", "<leader>tr", function()
			require("neotest").run.run()
		end, { desc = "run nearest test" })
		keymap("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "run current file" })
		keymap("n", "<leader>to", function()
			require("neotest").output.open({ enter = true })
		end, { desc = "open output" })
		keymap("n", "<leader>tp", function()
			require("neotest").output_panel.toggle()
		end, { desc = "toggle output panel" })
		keymap("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "toggle summary" })
	end,

	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
				require("neotest-jest")({
					jestCommand = "npm test --",
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
				require("rustaceanvim.neotest"),
			},
			icons = {
				failed = " ",
				passed = " ",
				running = "󰑮",
				skipped = "",
				unknown = "",
			},
			summary = {
				mappings = {
					attach = "a",
					clear_marked = "M",
					clear_target = "T",
					debug = "d",
					debug_marked = "D",
					expand = { "<CR>", "<2-LeftMouse>" },
					expand_all = "e",
					jumpto = "i",
					mark = "m",
					next_failed = "J",
					output = "o",
					prev_failed = "K",
					run = "r",
					run_marked = "R",
					short = "O",
					stop = "u",
					target = "t",
				},
				open = "botright vsplit | vertical resize 50",
			},
		})
	end,
}

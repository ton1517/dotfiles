return {
	"monaqa/dial.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	keys = {
		{ "<Plug>(dial-increment)", mode = { "n", "x" } },
		{ "<Plug>(dial-decrement)", mode = { "n", "x" } },
	},

	init = function()
		local keymap = vim.keymap.set
		local opt = { silent = true, noremap = true }

		keymap({ "n", "x" }, "<C-a>", "<Plug>(dial-increment)", opt)
		keymap({ "n", "x" }, "<C-x>", "<Plug>(dial-decrement)", opt)
		keymap({ "x" }, "g<C-a>", "g<Plug>(dial-increment)", opt)
		keymap({ "x" }, "g<C-x>", "g<Plug>(dial-decrement)", opt)
	end,

	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.hexcolor.new({ case = "lower" }),
				augend.date.alias["%Y/%m/%d"],
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%Y年%-m月%-d日"],
				augend.date.alias["%m/%d"],
				augend.date.alias["%H:%M:%S"],
				augend.date.alias["%H:%M"],
				augend.constant.alias.ja_weekday,
				augend.constant.alias.ja_weekday_full,
				augend.constant.alias.bool,
				augend.semver.alias.semver,
			},
		})
	end,
}

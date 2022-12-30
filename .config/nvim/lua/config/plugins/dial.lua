return {
	"monaqa/dial.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,

	init = function()
		local keymap = vim.keymap.set
		local opt = { silent = true, noremap = true }

		keymap("n", "<C-a>", require("dial.map").inc_normal(), opt)
		keymap("n", "<C-x>", require("dial.map").dec_normal(), opt)
		keymap("v", "<C-a>", require("dial.map").inc_visual(), opt)
		keymap("v", "<C-x>", require("dial.map").dec_visual(), opt)
		keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), opt)
		keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), opt)
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

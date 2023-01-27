return {
	"hrsh7th/nvim-insx",
	event = { "InsertEnter" },

	config = function()
		local insx = require("insx")
		local esc = require("insx.helper.regex").esc
		local add = insx.add
		local jump_next = require("insx.recipe.jump_next")
		local auto_pair = require("insx.recipe.auto_pair")
		local delete_pair = require("insx.recipe.delete_pair")
		local pair_spacing = require("insx.recipe.pair_spacing")
		local fast_break = require("insx.recipe.fast_break")
		local fast_wrap = require("insx.recipe.fast_wrap")

		local cmdline_jump_out = require("insx.recipe.cmdline.jump_out")
		local cmdline_auto_pair = require("insx.recipe.cmdline.auto_pair")
		local cmdline_delete_pair = require("insx.recipe.cmdline.delete_pair")

		for _, s in ipairs({ '"', "'", "`" }) do
			local e_s = esc(s)
			add(s, jump_next({ jump_pat = { [[\\\@<!\%#]] .. e_s .. [[\zs]] } }))
			add(s, auto_pair({ open = s, close = s, ignore_pat = (s == "'" and [[\(\a\|\\\)\%#]] or [[\\\%#]]) }))
			add("<BS>", delete_pair({ open_pat = e_s, close_pat = e_s, ignore_pat = ([[\\%s\%%#]]):format(e_s) }))
			add("<C-]>", fast_wrap({ close = s }))

			add(s, cmdline_jump_out({ close = s, ignore_escaped = true }), { mode = "c" })
			add(s, cmdline_auto_pair({ open = s, close = s, ignore_escaped = true }), { mode = "c" })
			add("<BS>", cmdline_delete_pair({ open = s, close = s, ignore_escaped = true }), { mode = "c" })
		end

		for open, close in pairs({
			["("] = ")",
			["["] = "]",
			["{"] = "}",
			["<"] = ">",
		}) do
			local e_open = esc(open)
			local e_close = esc(close)

			add(close, jump_next({ jump_pat = { [[\%#]] .. e_close .. [[\zs]] } }))
			add(open, auto_pair({ open = open, close = close }))
			add("<BS>", delete_pair({ open_pat = e_open, close_pat = e_close }))
			add("<Space>", pair_spacing.increase({ open_pat = e_open, close_pat = e_close }))
			add("<BS>", pair_spacing.decrease({ open_pat = e_open, close_pat = e_close }))
			add("<CR>", fast_break({ open_pat = e_open, close_pat = e_close, split = true }))
			add("<C-]>", fast_wrap({ close = close }))

			add(close, cmdline_jump_out({ close = close, ignore_escaped = true }), { mode = "c" })
			add(open, cmdline_auto_pair({ open = open, close = close, ignore_escaped = true }), { mode = "c" })
			add("<BS>", cmdline_delete_pair({ open = open, close = close }), { mode = "c" })
		end
	end,
}

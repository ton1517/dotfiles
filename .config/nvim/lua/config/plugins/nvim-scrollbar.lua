local M = {}

M.setup = function() end

M.config = function()
	require("scrollbar.handlers.search").setup()
	require("scrollbar").setup({
		show = true,
		set_highlights = true,
		handle = {
			color = "#777777",
		},
		marks = {
			Search = { color = "#ff9e64" },
			Error = { color = "#db4b4b" },
			Warn = { color = "#e0af68" },
			Info = { color = "#0db9d7" },
			Hint = { color = "#1abc9c" },
			Misc = { color = "#9d7cd8" },
			GitAdd = {
				color = "#9ed072",
				text = { "+" },
				priority = 5,
				cterm = nil,
				highlight = "CursorColumn",
			},
			GitDelete = {
				color = "#fc5d7c",
				text = { "-" },
				priority = 5,
				cterm = nil,
				highlight = "CursorColumn",
			},
			GitChange = {
				color = "#76cce0",
				text = { "*" },
				priority = 5,
				cterm = nil,
				highlight = "CursorColumn",
			},
		},
		handlers = {
			diagnostic = true,
			search = true,
		},
	})

	local gitsign = require("gitsigns")
	local gitsign_hunks = require("gitsigns.hunks")

	require("scrollbar.handlers").register("git", function(bufnr)
		local nb_lines = vim.api.nvim_buf_line_count(bufnr)
		local colors_type = {
			add = "GitAdd",
			delete = "GitDelete",
			change = "GitChange",
			changedelete = "GitChange",
		}

		local lines = {}
		local hunks = gitsign.get_hunks(bufnr)
		if hunks then
			for _, hunk in ipairs(hunks) do
				hunk.vend = math.min(hunk.added.start, hunk.removed.start) + hunk.added.count + hunk.removed.count
				local signs = gitsign_hunks.calc_signs(hunk, 0, nb_lines)
				for _, sign in ipairs(signs) do
					table.insert(lines, {
						line = sign.lnum,
						type = colors_type[sign.type],
					})
				end
			end
		end
		return lines
	end)
end

return M

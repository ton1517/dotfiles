return {
	-- Super fast git decorations implemented purely in lua/teal.
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",

	config = function()
		require("gitsigns").setup({
			signcolumn = true,
			numhl = true,
			linehl = false,
			word_diff = false,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Gitsigns next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Gitsigns prev hunk" })

				-- Actions
				map({ "n", "v" }, "<C-g>a", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns stage hunk" })
				map("n", "<C-g>A", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
				map({ "n", "v" }, "<C-g>r", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })
				map("n", "<C-g>R", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
				map("n", "<C-g>u", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
				map("n", "<C-g>p", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
				map("n", "<C-g>b", function()
					gs.blame_line({ full = true })
				end, { desc = "Gitsigns blame line" })
				map("n", "<C-g>lb", gs.toggle_current_line_blame, { desc = "Gitsigns toggle current line blame" })
				map("n", "<C-g>d", gs.diffthis, { desc = "Gitsigns diffthis" })
				map("n", "<C-g>D", function()
					gs.diffthis("~")
				end, { desc = "Gitsigns diffthis~" })
				map("n", "<C-g>td", gs.toggle_deleted, { desc = "Gitsigns toggle deleted" })
			end,
		})
	end,
}

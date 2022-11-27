local M = {}

M.setup = function() end

M.config = function()
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
			map({ "n", "v" }, "<leader>ga", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns stage hunk" })
			map("n", "<leader>gA", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
			map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset hunk" })
			map("n", "<leader>gR", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
			map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
			map("n", "<leader>gp", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { desc = "Gitsigns blame line" })
			map("n", "<leader>glb", gs.toggle_current_line_blame, { desc = "Gitsigns toggle current line blame" })
			map("n", "<leader>gd", gs.diffthis, { desc = "Gitsigns diffthis" })
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { desc = "Gitsigns diffthis~" })
			map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Gitsigns toggle deleted" })
		end,
	})
end

return M

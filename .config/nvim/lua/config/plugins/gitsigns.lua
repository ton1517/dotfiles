local M = {}

M.setup = function() end

M.config = function()
	require("gitsigns").setup({
		signcolumn = true,
		numhl = true,
		linehl = false,
		word_diff = false,
		on_attach = function(bufnr)
			local function map(mode, lhs, rhs, opts)
				opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
			end

			-- Navigation
			map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
			map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

			-- Actions
			map("n", "<leader>ga", ":Gitsigns stage_hunk<CR>")
			map("v", "<leader>ga", ":Gitsigns stage_hunk<CR>")
			map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
			map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
			map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
			map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>")
		end,
	})
end

return M

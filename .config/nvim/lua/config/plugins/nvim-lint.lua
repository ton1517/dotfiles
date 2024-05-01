return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			yaml = { "actionlint" },
			markdown = { "markdownlint" },
			python = { "flake8" },
			go = { "golangcilint" },
		}

		local group = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = group,
			callback = function()
				lint.try_lint()
				lint.try_lint("codespell")
			end,
		})
	end,
}

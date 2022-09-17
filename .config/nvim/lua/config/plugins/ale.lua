local M = {}

M.setup = function() end

M.config = function()
	vim.keymap.set("n", "<leader>aj", ":ALENext<cr>")
	vim.keymap.set("n", "<leader>ak", ":ALEPrevious<cr>")

	vim.g.ale_disable_lsp = 1

	vim.g.ale_sign_error = "\u{f05e}"
	vim.g.ale_sign_warning = "\u{f071}"
	vim.g.ale_sign_column_always = 1

	vim.g.ale_set_loclist = 0
	vim.g.ale_set_quickfix = 0
	vim.g.ale_open_list = 0
	vim.g.ale_keep_list_window_open = 0

	vim.g.ale_lint_on_enter = 1
	vim.g.ale_lint_on_save = 1
	vim.g.ale_lint_on_text_changed = "never"
	vim.g.ale_linters = {
		css = { "prettier", "stylelint" },
		go = { "golint", "govet", "golangci-lint" },
		javascript = { "prettier", "eslint" },
		json = { "jq" },
		scss = { "prettier", "stylelint" },
		typescript = { "prettier", "eslint" },
		vue = { "prettier", "eslint", "stylelint" },
	}

	vim.g.ale_fix_on_save = 1
	vim.g.ale_fixers = {
		css = { "prettier", "stylelint" },
		dart = { "dart-format" },
		go = { "goimports" },
		javascript = { "prettier", "eslint" },
		json = { "jq" },
		scss = { "prettier", "stylelint" },
		typescript = { "prettier", "eslint" },
		vue = { "prettier", "eslint", "stylelint" },
	}

	vim.g.ale_dart_format_options = "--line-length 140"
	vim.g.ale_go_golangci_lint_options = ""
end

return M

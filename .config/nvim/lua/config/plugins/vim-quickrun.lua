local M = {}

M.setup = function()
	vim.keymap.set("n", "<Leader>r", "<Plug>(quickrun)")
	vim.g.quickrun_config = {
		markdown = {
			args = "Marked",
			cmdopt = "-a",
			command = "open",
			exec = "%c %o %a %s",
			["outputter/buffer/close_on_empty"] = 1,
		},
		typescript = {
			cmdopt = "run",
			command = "deno",
		},
	}
end

M.config = function() end

return M

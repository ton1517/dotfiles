return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local util = require("conform.util")

		local js_formatters = { "biome-check", "prettierd", "eslint_d" }

		require("conform").setup({
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 3000, lsp_fallback = false }
			end,

			formatters_by_ft = {
				javascript = js_formatters,
				javascriptreact = js_formatters,
				typescript = js_formatters,
				typescriptreact = js_formatters,
				json = { { "biome-check", "jq" } },
				jsonc = { "biome-check" },
				lua = { "stylua" },
				python = { "black" },
				yaml = { "yamlfmt" },
				rust = { "rustfmt" },
			},
			formatters = {
				["biome-check"] = {
					require_cwd = true,
				},
				eslint_d = {
					cwd = util.root_file({ ".eslintrc.json", ".eslintrc.js", ".eslint.config.js" }),
					require_cwd = true,
				},
				prettierd = {
					cwd = util.root_file({ ".prettierrc", ".prettierrc.js" }),
					require_cwd = true,
				},
			},
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = false, range = range })
		end, { range = true })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}

return {
	-- A completion plugin for neovim coded in Lua.
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },

	dependencies = {
		"L3MON4D3/LuaSnip",
		-- vscode-like pictograms for neovim lsp completion items
		"onsails/lspkind.nvim",
		-- nvim-cmp source for neovim's built-in language server client.
		"hrsh7th/cmp-nvim-lsp",
		-- nvim-cmp source for buffer words.
		"hrsh7th/cmp-buffer",
		-- nvim-cmp source for filesystem paths.
		"hrsh7th/cmp-path",
		-- nvim-cmp source for vim's cmdline.
		"hrsh7th/cmp-cmdline",
		-- nvim-cmp source for getting completions from command-line or search histories.
		"dmitmel/cmp-cmdline-history",
		-- luasnip completion source for nvim-cmp
		"saadparwaiz1/cmp_luasnip",
		-- look source for nvim-cmp
		"octaltree/cmp-look",
	},

	config = function()
		local sources = {
			nvim_lsp = {
				name = "nvim_lsp",
				max_item_count = 10,
			},
			luasnip = { name = "luasnip" },
			path = { name = "path" },
			buffer = { name = "buffer" },
			look = {
				name = "look",
				keyword_length = 3,
				max_item_count = 10,
				option = {
					convert_case = true,
					loud = true,
				},
			},
			cmdline = { name = "cmdline" },
			cmdline_history = { name = "cmdline_history" },
		}
		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		cmp.setup({
			experimental = {
				ghost_text = {},
			},
			window = {
				completion = {
					border = "rounded",
				},
				documentation = {
					border = "rounded",
				},
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol",
					maxwidth = 50,
					menu = {
						buffer = "[Buffer]",
						luasnip = "[LuaSnip]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
						look = "[Look]",
					},
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				["<Tab>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				sources.nvim_lsp,
				sources.luasnip,
				sources.path,
			}, {
				sources.buffer,
				sources.look,
			}),
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				sources.buffer,
			}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				sources.path,
			}, {
				sources.cmdline,
				sources.cmdline_history,
			}),
		})
	end,
}

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

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		cmp.setup({
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
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-c>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
			}),
			sources = cmp.config.sources({
				sources.nvim_lsp,
				sources.luasnip,
				sources.path,
			}, {
				sources.buffer,
				sources.look,
			}),
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

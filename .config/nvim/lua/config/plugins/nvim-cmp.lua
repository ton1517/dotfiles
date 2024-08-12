return {
	-- A completion plugin for neovim coded in Lua.
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },

	dependencies = {
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
		-- look source for nvim-cmp
		"octaltree/cmp-look",
	},

	config = function()
		local sources = {
			nvim_lsp = {
				name = "nvim_lsp",
				max_item_count = 10,
			},
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
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol",
					maxwidth = 50,
					menu = {
						buffer = "[Buffer]",
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
				["<Tab>"] = cmp.mapping.confirm({ select = false }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
			}),
			sources = cmp.config.sources({
				sources.nvim_lsp,
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

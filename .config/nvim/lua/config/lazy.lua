local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

if vim.g.vscode then
	require("lazy").setup({
		require("config.plugins.dial"),
		require("config.plugins.flash"),
		require("config.plugins.nvim-surround"),
		require("config.plugins.switch"),
		require("config.plugins.vim-expand-region"),
		require("config.plugins.vim-illuminate"),
		require("config.plugins.vim-operator-replace"),
		require("config.plugins.vim-repeat"),
		require("config.plugins.vim-textmanip"),
		require("config.plugins.vim-textobj"),
	}, {
		performance = {
			rtp = {
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"netrwPlugin",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
					"nvim-treesitter-textobjects",
				},
			},
		},
	})
else
	require("lazy").setup("config.plugins", {
		install = { missing = true, colorscheme = { "everforest" } },
		performance = {
			rtp = {
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
					"nvim-treesitter-textobjects",
				},
			},
		},
	})
end

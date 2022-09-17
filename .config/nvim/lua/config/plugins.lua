local keys = require('config.packer.util').get_keys
local config = require('config.packer.util').get_config
local setup = require('config.packer.util').get_setup

return function(use)
  -- packer.nvim
  use { 'wbthomason/packer.nvim', opt = true }
  -- color scheme
  use { 'sainnhe/sonokai', config = config('sonokai') }
  -- Treesitter configurations and abstraction layer for Neovim.
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = config('nvim-treesitter') }
  -- A fancy, configurable, notification manager for NeoVim
  use { 'rcarriga/nvim-notify', config = config('nvim-notify') }
  -- A Git wrapper so awesome, it should be illegal
  use 'tpope/vim-fugitive'
  -- GitHub extension for fugitive.vim
  use 'tpope/vim-rhubarb'
  -- Add/change/delete surrounding delimiter pairs with ease.
  use { 'kylechui/nvim-surround', config = config('nvim-surround') }
  -- Smart and Powerful commenting plugin for neovim
  use { 'numToStr/Comment.nvim', config = config('comment-nvim') }
  -- EditorConfig plugin for Vim
  use 'editorconfig/editorconfig-vim'
  -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
  use { 'dense-analysis/ale', config = config('ale') }
  -- enable repeating supported plugin maps with "."
  use 'tpope/vim-repeat'
  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use 'andymass/vim-matchup'
  -- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  use 'RRethy/vim-illuminate'
  -- alpha is a fast and fully programmable greeter for neovim.
  use { 'goolord/alpha-nvim', requires = 'kyazdani42/nvim-web-devicons', config = config('alpha-nvim') }
  -- a highly extendable fuzzy finder over lists.
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = config('telescope') }
  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons', config = config('lualine') }
  -- displays a popup with possible key bindings of the command you started typing.
  use { 'folke/which-key.nvim', config = config('which-key') }
  -- Super fast git decorations implemented purely in lua/teal.
  use { 'lewis6991/gitsigns.nvim', config = config('gitsigns') }
  -- The fastest Neovim colorizer.
  use { 'norcalli/nvim-colorizer.lua', config = config('nvim-colorizer') }
  -- Hlsearch Lens for Neovim
  use { 'kevinhwang91/nvim-hlslens', config = config('nvim-hlslens') }
  -- Extensible Neovim Scrollbar
  use { 'petertriho/nvim-scrollbar', requires = { 'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim' },
    config = config('nvim-scrollbar') }
  -- Snippets collection for a set of different programming languages for faster development.
  use 'rafamadriz/friendly-snippets'
  -- Snippet Engine for Neovim written in Lua.
  use { 'L3MON4D3/LuaSnip', requires = 'rafamadriz/friendly-snippets', config = config('friendly-snippets') }
  -- vscode-like pictograms for neovim lsp completion items
  use 'onsails/lspkind.nvim'
  -- A completion plugin for neovim coded in Lua.
  use { 'hrsh7th/nvim-cmp', requires = { 'L3MON4D3/LuaSnip', 'onsails/lspkind.nvim' }, config = config('nvim-cmp') }
  -- nvim-cmp source for neovim's built-in language server client.
  use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
  -- nvim-cmp source for buffer words.
  use { 'hrsh7th/cmp-buffer', requires = 'hrsh7th/nvim-cmp' }
  -- nvim-cmp source for filesystem paths.
  use { 'hrsh7th/cmp-path', requires = 'hrsh7th/nvim-cmp' }
  -- nvim-cmp source for vim's cmdline.
  use { 'hrsh7th/cmp-cmdline', requires = 'hrsh7th/nvim-cmp' }
  -- luasnip completion source for nvim-cmp
  use { 'saadparwaiz1/cmp_luasnip', requires = 'hrsh7th/nvim-cmp' }
  -- TabNine plugin for hrsh7th/nvim-cmp
  use { 'tzachar/cmp-tabnine', requires = 'hrsh7th/nvim-cmp', run = './install.sh' }
  -- look source for nvim-cmp
  use { 'octaltree/cmp-look', requires = 'hrsh7th/nvim-cmp' }
  -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
  use { 'williamboman/mason.nvim', config = config('mason') }
  -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
  use { 'williamboman/mason-lspconfig.nvim', config = config('mason-lspconfig') }
  -- Quickstart configs for Nvim LSP
  use {
    'neovim/nvim-lspconfig',
    requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp' },
    config = config('nvim-lspconfig'),
  }
  -- LSP signature hint as you type
  use { 'ray-x/lsp_signature.nvim', config = config('lsp_signature') }
  -- Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
  use 'folke/lsp-colors.nvim'
  -- light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
  use { 'tami5/lspsaga.nvim', requires = 'folke/lsp-colors.nvim', config = config('lspsaga') }
  -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  use { 'j-hui/fidget.nvim', config = config('fidget') }
  -- A Neovim bufferline for people with addictive personalities
  use { 'noib3/nvim-cokeline', requires = 'kyazdani42/nvim-web-devicons', config = config('nvim-cokeline') }
  -- Neovim plugin for locking a buffer to a window
  use { 'stevearc/stickybuf.nvim', config = config('stickybuf') }
  -- Automatic indentation style detection for Neovim
  use { 'NMAC427/guess-indent.nvim', config = config('guess-indent') }
  -- Tint inactive windows in Neovim using window-local highlight namespaces.
  use { 'levouh/tint.nvim', config = config('tint') }
  -- Vim plugin for working with python virtualenvs
  use { 'jmcantrell/vim-virtualenv', ft = { 'python', 'python3' } }
  -- Go development plugin for Vim
  use { 'fatih/vim-go', ft = 'go', config = config('vim-go') }
  -- Vim plugin for https://github.com/cweill/gotests
  use { 'buoto/gotests-vim', ft = 'go' }
  -- Tools to help create flutter apps in neovim using the native lsp
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim', ft = 'dart', config = config('flutter-tools') }
  -- EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
  use { 'phaazon/hop.nvim', cmd = { 'HopWord', 'HopChar2' }, setup = setup('hop'), config = config('hop') }
  -- A simple Vim plugin to switch segments of text with predefined replacements
  use { 'AndrewRadev/switch.vim', cmd = 'Switch', setup = setup('switch') }
  -- easy text manupilation for vim
  use { 't9md/vim-textmanip', keys = keys({ 'n', 'x', 'o' }, '<Plug>'), setup = setup('vim-textmanip') }
  -- Help folks to align text, eqns, declarations, tables, etc
  use { 'vim-scripts/Align', cmd = 'Align', setup = setup('align') }
  -- Text objects for indented blocks of lines
  use {
    'kana/vim-textobj-indent',
    requires = 'kana/vim-textobj-user',
    keys = keys({ 'o', 'x' }, { { 'i', 'a' }, { 'i', 'I' } }),
  }
  -- Text objects for the current line
  use { 'kana/vim-textobj-line', requires = 'kana/vim-textobj-user' }
  -- provide text objects (a, and i, by default) to select parameters of functions.
  use { 'sgur/vim-textobj-parameter', requires = 'kana/vim-textobj-user', keys = keys({ 'o', 'x' }, { 'i,', 'a,' }), }
  -- Operator to replace text with register content
  use {
    'kana/vim-operator-replace',
    requires = 'kana/vim-operator-user',
    keys = '<Plug>(operator-replace)',
    setup = setup('vim-operator-replace'),
  }
  --  provide some operators to convert a word case.
  use {
    'mopp/vim-operator-convert-case',
    requires = { 'kana/vim-operator-user', 'tpope/vim-repeat' },
    keys = keys({ 'n', 'v' }, '<Plug>(operator-convert-case-'),
    setup = setup('vim-operator-convert-case'),
  }
  -- A code outline window for skimming and quick navigation
  use { 'stevearc/aerial.nvim', cmd = 'AerialOpen', setup = setup('aerial'), config = config('aerial') }
  -- Nvim-plugin for doing the opposite of join-line (J) of arguments, powered by treesitter
  use { 'AckslD/nvim-trevJ.lua', requires = 'nvim-treesitter/nvim-treesitter', module = 'trevj',
    setup = setup('nvim-trevj'), config = config('nvim-trevj') }
  -- A Vim plugin to visualizes the Vim undo tree.
  use { 'simnalamburt/vim-mundo', cmd = 'MundoToggle', setup = setup('vim-mundo') }
  -- This plugin adds indentation guides to all lines (including empty lines).
  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead', config = config('indent-blankline') }
  -- Rainbow parentheses for neovim using tree-sitter.
  use { 'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter', event = 'BufRead' }
  -- Show git diff for Git Rebase Interactive
  use { 'hotwatermorning/auto-git-diff', ft = 'gitrebase', config = config('auto-git-diff') }
  -- More Pleasant Editing on Commit Message
  use { 'rhysd/committia.vim', ft = 'gitcommit' }
  -- Detects the language using treesitter and adds a comment block
  use {
    's1n7ax/nvim-comment-frame',
    requires = 'nvim-treesitter/nvim-treesitter',
    module = 'nvim-comment-frame',
    setup = setup('nvim-comment-frame'),
    config = config('nvim-comment-frame'),
  }
  -- Improved Yank and Put functionalities for Neovim
  use { 'gbprod/yanky.nvim', requires = 'nvim-telescope/telescope.nvim', config = config('yanky') }
  -- Run commands quickly.
  use { 'thinca/vim-quickrun', keys = '<Plug>(quickrun)', setup = setup('vim-quickrun') }
  -- A super powerful autopair plugin for Neovim that supports multiple characters.
  use { 'windwp/nvim-autopairs', event = 'InsertEnter', config = config('nvim-autopairs') }
  -- Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
  use { 'terryma/vim-expand-region', keys = { { 'v', '<Plug>(expand_region' } }, setup = setup('vim-expand-region') }
  -- Region selection with hints on the AST nodes of a document powered by treesitter
  use { 'mfussenegger/nvim-treehopper', requires = 'nvim-treesitter/nvim-treesitter', module = 'tsht',
    setup = setup('nvim-treehopper') }
  -- Neovim plugin to manage the file system and other tree like structures.
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    cmd = 'Neotree',
    setup = setup('neo-tree'),
    config = config('neo-tree'),
  }
  -- asterisk.vim provides improved * motions.
  use {
    'haya14busa/vim-asterisk',
    requires = 'kevinhwang91/nvim-hlslens',
    keys = '<Plug>(asterisk-',
    setup = setup('vim-asterisk'),
  }
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", cmd = 'TroubleToggle', setup = setup('trouble') }
  -- Better quickfix window in Neovim, polish old quickfix window.
  use { 'kevinhwang91/nvim-bqf', ft = 'qf', config = config('nvim-bqf') }
  -- Show code context
  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = config('nvim-treesitter-context'),
  }
  -- Delete Neovim buffers without losing window layout
  use { 'famiu/bufdelete.nvim', cmd = 'Bdelete', setup = setup('bufdelete') }
  -- Use treesitter to auto close and auto rename html tag
  use {
    'windwp/nvim-ts-autotag',
    requires = 'nvim-treesitter/nvim-treesitter',
    ft = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
      'rescript', 'xml' },
    config = config('nvim-ts-autotag'),
  }
  -- Move to the edge!
  use { 'haya14busa/vim-edgemotion', keys = '<Plug>(edgemotion-', setup = setup('vim-edgemotion') }
end

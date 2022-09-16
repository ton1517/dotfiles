local get_keys = require('config.packer.util').get_keys
return function(use)
  -- packer.nvim
  use {'wbthomason/packer.nvim', opt = true }
  -- color scheme
  use {
    'sainnhe/sonokai',
    config = function()
      vim.cmd([[
      let g:sonokai_style = 'default'
      let g:sonokai_disable_italic_comment = 1
      let g:sonokai_diagnostic_text_highlight = 1
      let g:sonokai_diagnostic_virtual_text = 'colored'
      let g:sonokai_better_performance = 1
      colorscheme sonokai
      ]])
    end,
  }
  -- Treesitter configurations and abstraction layer for Neovim.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.plugins.nvim-treesitter')
    end,
  }
  -- A fancy, configurable, notification manager for NeoVim
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  }
  -- A Git wrapper so awesome, it should be illegal
  use 'tpope/vim-fugitive'
  -- GitHub extension for fugitive.vim
  use 'tpope/vim-rhubarb'
  -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
  use 'tpope/vim-surround'
  -- Smart and Powerful commenting plugin for neovim
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- EditorConfig plugin for Vim
  use 'editorconfig/editorconfig-vim'
  -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
  use {
    'dense-analysis/ale',
    config = function()
      require('config.plugins.ale')
    end,
  }
  -- enable repeating supported plugin maps with "."
  use 'tpope/vim-repeat'
  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use 'andymass/vim-matchup'
  -- highlight the word under the cursor.
  use 'xiyaowong/nvim-cursorword'
  -- alpha is a fast and fully programmable greeter for neovim.
  use {
    'goolord/alpha-nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('alpha').setup(require 'alpha.themes.startify'.config)
    end,
  }
  -- a highly extendable fuzzy finder over lists.
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('config.plugins.telescope')
    end,
  }
  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.plugins.lualine')
    end,
  }
  -- displays a popup with possible key bindings of the command you started typing.
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end,
  }
  -- Super fast git decorations implemented purely in lua/teal.
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.plugins.gitsigns')
    end,
  }
  -- The fastest Neovim colorizer.
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }
  -- Hlsearch Lens for Neovim
  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('config.plugins.nvim-hlslens')
    end,
  }
  -- Extensible Neovim Scrollbar
  use {
    'petertriho/nvim-scrollbar',
    requires = { 'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim' },
    config = function()
      require('config.plugins.nvim-scrollbar')
    end,
  }
  -- Snippets collection for a set of different programming languages for faster development.
  use 'rafamadriz/friendly-snippets'
  -- Snippet Engine for Neovim written in Lua.
  use {
    'L3MON4D3/LuaSnip',
    requires = 'rafamadriz/friendly-snippets',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  }
  -- vscode-like pictograms for neovim lsp completion items
  use 'onsails/lspkind.nvim'
  -- A completion plugin for neovim coded in Lua.
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'L3MON4D3/LuaSnip', 'onsails/lspkind.nvim' },
    config = function()
      require('config.plugins.nvim-cmp')
    end,
  }
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
  use {
    'williamboman/mason.nvim',
    config = function()
      require('config.plugins.mason')
    end,
  }
  -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('config.plugins.mason-lspconfig')
    end,
  }
  -- Quickstart configs for Nvim LSP
  use {
    'neovim/nvim-lspconfig',
    requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      require('config.plugins.nvim-lspconfig')
    end,
  }
  -- LSP signature hint as you type
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end
  }
  -- Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
  use 'folke/lsp-colors.nvim'
  -- light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
  use {
    'tami5/lspsaga.nvim',
    requires = 'folke/lsp-colors.nvim',
    config = function()
      require('config.plugins.lspsaga')
    end
  }
  -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {}

    end
  }
  -- A Neovim bufferline for people with addictive personalities
  use {
    'noib3/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.plugins.nvim-cokeline')
    end
  }
  -- Neovim plugin for locking a buffer to a window
  use {
    'stevearc/stickybuf.nvim',
    config = function()
      require('config.plugins.stickybuf')
    end
  }
  -- Automatic indentation style detection for Neovim
  use {
    'NMAC427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end
  }
  -- Tint inactive windows in Neovim using window-local highlight namespaces.
  use {
    'levouh/tint.nvim',
    config = function()
      require("tint").setup()
    end
  }
  -- Vim plugin for working with python virtualenvs
  use { 'jmcantrell/vim-virtualenv', ft = { 'python', 'python3' } }
  -- Go development plugin for Vim
  use {
    'fatih/vim-go',
    ft = 'go',
    config = function()
      require('config.plugins.vim-go')
    end
  }
  -- Vim plugin for https://github.com/cweill/gotests
  use { 'buoto/gotests-vim', ft = 'go' }
  -- Tools to help create flutter apps in neovim using the native lsp
  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    ft = 'dart',
    config = function()
      require('config.plugins.flutter-tools')
    end
  }
  -- EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
  use {
    'phaazon/hop.nvim',
    cmd = { 'HopWord', 'HopChar2' },
    setup = function()
      vim.keymap.set('n', '<Leader>e', ':HopWord<cr>')
      vim.keymap.set('n', '<Leader>s', ':HopChar2<cr>')
    end,
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  }
  -- A simple Vim plugin to switch segments of text with predefined replacements
  use {
    'AndrewRadev/switch.vim',
    cmd = 'Switch',
    setup = function()
      vim.keymap.set('n', '-', ':Switch<cr>')
    end,
  }
  -- easy text manupilation for vim
  use {
    't9md/vim-textmanip',
    keys = get_keys({ 'n', 'x', 'o' }, '<Plug>'),
    setup = function()
      vim.keymap.set('x', '<S-j>', '<Plug>(textmanip-move-down)')
      vim.keymap.set('x', '<S-k>', '<Plug>(textmanip-move-up)')
      vim.keymap.set('x', '<S-h>', '<Plug>(textmanip-move-left)')
      vim.keymap.set('x', '<S-l>', '<Plug>(textmanip-move-right)')

      vim.keymap.set({ 'n', 'x' }, '<Space>d', '<Plug>(textmanip-duplicate-down)')
      vim.keymap.set({ 'n', 'x' }, '<Space>D', '<Plug>(textmanip-duplicate-up)')
    end,
  }
  -- Help folks to align text, eqns, declarations, tables, etc
  use {
    'vim-scripts/Align',
    cmd = 'Align',
    setup = function()
      vim.keymap.set('v', 'a>', ':Align =><CR>')
      vim.keymap.set('v', 'a=', ':Align =<CR>')
    end,
  }
  -- Text objects for indented blocks of lines
  use {
    'kana/vim-textobj-indent',
    requires = 'kana/vim-textobj-user',
    keys = get_keys({ 'o', 'x' }, { { 'i', 'a' }, { 'i', 'I' } })
  }
  -- Text objects for the current line
  use {
    'kana/vim-textobj-line',
    requires = 'kana/vim-textobj-user',
    -- keys = get_keys({ 'v', 'o' }, { 'il', 'al' }),
  }
  -- provide text objects (a, and i, by default) to select parameters of functions.
  use {
    'sgur/vim-textobj-parameter',
    requires = 'kana/vim-textobj-user',
    keys = get_keys({ 'o', 'x' }, { 'i,', 'a,' }),
  }
  -- Operator to replace text with register content
  use {
    'kana/vim-operator-replace',
    requires = 'kana/vim-operator-user',
    keys = '<Plug>(operator-replace)',
    setup = function()
      vim.keymap.set('', '<S-r>', '<Plug>(operator-replace)')
    end,
  }
  --  provide some operators to convert a word case.
  use {
    'mopp/vim-operator-convert-case',
    requires = { 'kana/vim-operator-user', 'tpope/vim-repeat' },
    keys = get_keys({ 'n', 'v' }, '<Plug>(operator-convert-case-'),
    setup = function()
      vim.keymap.set('n', ',clc', '<Plug>(operator-convert-case-lower-camel)iw')
      vim.keymap.set('n', ',cuc', '<Plug>(operator-convert-case-upper-camel)iw')
      vim.keymap.set('n', ',cls', '<Plug>(operator-convert-case-lower-snake)iw')
      vim.keymap.set('n', ',cus', '<Plug>(operator-convert-case-upper-snake)iw')
      vim.keymap.set('v', ',clc', '<Plug>(operator-convert-case-lower-camel)gv')
      vim.keymap.set('v', ',cuc', '<Plug>(operator-convert-case-upper-camel)gv')
      vim.keymap.set('v', ',cls', '<Plug>(operator-convert-case-lower-snake)gv')
      vim.keymap.set('v', ',cus', '<Plug>(operator-convert-case-upper-snake)gv')
    end,
  }
  -- A code outline window for skimming and quick navigation
  use {
    'stevearc/aerial.nvim',
    cmd = 'AerialOpen',
    setup = function()
      vim.keymap.set('n', ',tb', ':AerialOpen<CR>')
    end,
    config = function()
      require('aerial').setup({})
    end,
  }
  -- Nvim-plugin for doing the opposite of join-line (J) of arguments, powered by treesitter
  use {
    'AckslD/nvim-trevJ.lua',
    requires = 'nvim-treesitter/nvim-treesitter',
    module = 'trevj',
    setup = function()
      vim.keymap.set('n', ',j', ":lua require('trevj').format_at_cursor()<CR>")
    end,
    config = function()
      require("trevj").setup()
    end
  }
  -- A Vim plugin to visualizes the Vim undo tree.
  use {
    'simnalamburt/vim-mundo',
    cmd = 'MundoToggle',
    setup = function()
      vim.keymap.set('n', ',mu', ':MundoToggle<CR>')
    end,
  }
  -- This plugin adds indentation guides to all lines (including empty lines).
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require('config.plugins.indent-blankline')
    end,
  }
  -- Rainbow parentheses for neovim using tree-sitter.
  use {
    'p00f/nvim-ts-rainbow',
    requires = 'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
  }
  -- Show git diff for Git Rebase Interactive
  use {
    'hotwatermorning/auto-git-diff',
    ft = 'gitrebase',
    config = function()
      vim.keymap.set('n', '<buffer><C-l>', '<Plug>(auto_git_diff_scroll_manual_update)')
      vim.keymap.set('n', '<buffer><C-n>', '<Plug>(auto_git_diff_scroll_down_half)')
      vim.keymap.set('n', '<buffer><C-p>', '<Plug>(auto_git_diff_scroll_up_half)')
    end,
  }
  -- More Pleasant Editing on Commit Message
  use { 'rhysd/committia.vim', ft = 'gitcommit' }
  -- Detects the language using treesitter and adds a comment block
  use {
    's1n7ax/nvim-comment-frame',
    requires = 'nvim-treesitter/nvim-treesitter',
    module = 'nvim-comment-frame',
    setup = function()
      vim.keymap.set('n', '<leader>cf', ":lua require('nvim-comment-frame').add_comment()<CR>")
      vim.keymap.set('n', '<leader>Cf', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>")
    end,
    config = function()
      require('nvim-comment-frame').setup({
        disable_default_keymap = true,
      })
    end,
  }
  -- Improved Yank and Put functionalities for Neovim
  use {
    'gbprod/yanky.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    setup = function()
      vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
      vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
      vim.keymap.set('n', '<C-n>', '<Plug>(YankyCycleForward)')
      vim.keymap.set('n', '<C-p>', '<Plug>(YankyCycleBackward)')

      vim.keymap.set('n', ',fy', '<cmd>Telescope yank_history<cr>')
    end,
    config = function()
      require('config.plugins.yanky')
    end,
  }
  -- Run commands quickly.
  use {
    'thinca/vim-quickrun',
    keys = '<Plug>(quickrun)',
    setup = function()
      vim.keymap.set('n', '<Leader>r', '<Plug>(quickrun)')
      vim.g.quickrun_config = {
        markdown = {
          args = "Marked",
          cmdopt = "-a",
          command = "open",
          exec = "%c %o %a %s",
          ["outputter/buffer/close_on_empty"] = 1
        },
        typescript = {
          cmdopt = "run",
          command = "deno"
        }
      }
    end,
  }
  -- A super powerful autopair plugin for Neovim that supports multiple characters.
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }
  -- Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
  use {
    'terryma/vim-expand-region',
    keys = { { 'v', '<Plug>(expand_region' } },
    setup = function()
      vim.keymap.set('v', 'v', '<Plug>(expand_region_expand)')
      vim.keymap.set('v', '<C-v>', '<Plug>(expand_region_shrink)')
    end,
  }
  -- Region selection with hints on the AST nodes of a document powered by treesitter
  use {
    'mfussenegger/nvim-treehopper',
    requires = 'nvim-treesitter/nvim-treesitter',
    module = 'tsht',
    setup = function()
      vim.keymap.set('o', 'm', ":<C-U>lua require('tsht').nodes()<CR>")
      vim.keymap.set('x', 'm', ":lua require('tsht').nodes()<CR>")
    end,
  }
  -- Neovim plugin to manage the file system and other tree like structures.
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    cmd = 'Neotree',
    setup = function()
      vim.keymap.set('n', '<Leader>f', ':Neotree<CR>')
    end,
    config = function()
      vim.cmd([[
      highlight NeoTreeGitConflict cterm=bold ctermfg=215 gui=bold guifg=#f39660
      highlight NeoTreeGitUntracked ctermfg=215 guifg=#f39660
      ]])
      require('config.plugins.neo-tree')
    end,
  }
  -- asterisk.vim provides improved * motions.
  use {
    'haya14busa/vim-asterisk',
    requires = 'kevinhwang91/nvim-hlslens',
    keys = '<Plug>(asterisk-',
    setup = function()
      vim.g['asterisk#keeppos'] = 1
      vim.keymap.set('', '*', "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>")
      vim.keymap.set('', '#', "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>")
      vim.keymap.set('', 'g*', "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>")
      vim.keymap.set('', 'g#', "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>")
    end,
  }
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  use {
    'folke/trouble.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    cmd = 'TroubleToggle',
    setup = function()
      vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
      vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
      vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
      vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
      vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')
    end,
  }
  -- Better quickfix window in Neovim, polish old quickfix window.
  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('config.plugins.nvim-bqf')
    end,
  }
  -- Show code context
  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('config.plugins.nvim-treesitter-context')
    end,
  }
  -- Delete Neovim buffers without losing window layout
  use {
    'famiu/bufdelete.nvim',
    cmd='Bdelete',
    setup = function()
      vim.keymap.set('n', 'bd', ':Bdelete<cr>')
    end,
  }
  -- Use treesitter to auto close and auto rename html tag
  use {
    'windwp/nvim-ts-autotag',
    requires = 'nvim-treesitter/nvim-treesitter',
    ft = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  }
end

"----------------------------------------
" for neovim
"----------------------------------------

let g:python_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'

"----------------------------------------
" source vimrc
"----------------------------------------

if filereadable(expand('$XDG_CONFIG_HOME/nvim/vimrc'))
  source $XDG_CONFIG_HOME/nvim/vimrc
endif

"----------------------------------------
" local settings
"----------------------------------------
"
" write additional local settings in ~/.vim/vimrc.local
if filereadable(expand('$XDG_CONFIG_HOME/nvim/vimrc.local'))
  source $XDG_CONFIG_HOME/nvim/vimrc.local
endif

"----------------------------------------
" source vim plugin settings
"----------------------------------------

if filereadable(expand('$XDG_CONFIG_HOME/nvim/rc/dein.rc.vim'))
  source $XDG_CONFIG_HOME/nvim/rc/dein.rc.vim
endif

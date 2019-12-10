"----------------------------------------
" for neovim
"----------------------------------------

let g:python_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'

"----------------------------------------
" source vim plugin settings
"----------------------------------------

if filereadable(expand('~/.vim/rc/dein.rc.vim'))
  source ~/.vim/rc/dein.rc.vim
endif

"----------------------------------------
" source vimrc
"----------------------------------------

if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif

"----------------------------------------
" local settings
"----------------------------------------
"
" write additional local settings in ~/.vim/vimrc.local
if filereadable(expand('~/.vim/vimrc.local'))
  source ~/.vim/vimrc.local
endif

"----------------------------------------
" source vim plugin settings
"----------------------------------------

if filereadable(expand('~/.vim/vimplugin'))
  source ~/.vim/vimplugin
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

let s:dein_dir = expand('~/.vim/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

let s:dein_toml      = '~/.vim/rc/dein.toml'
let s:dein_lazy_toml = '~/.vim/rc/dein_lazy.toml'

if &compatible
  set nocompatible
endif

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" if !dein#load_state(s:dein_dir)
"    finish
" endif

call dein#begin(s:dein_dir, [$MYVIMRC, s:dein_toml, s:dein_lazy_toml])

call dein#load_toml(s:dein_toml,      {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})

call dein#end()
" call dein#save_state()

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

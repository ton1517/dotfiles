augroup MyAutoCmd
autocmd!
augroup END

if &compatible
  set nocompatible
endif

let s:dein_repo_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'floating'
let g:dein#install_check_diff = v:true
let g:dein#enable_notification = v:true

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#load_toml('~/.vim/rc/dein.toml',              {'lazy': 0})
    call dein#load_toml('~/.vim/rc/dein_coc.toml',          {'lazy': 0})
    call dein#load_toml('~/.vim/rc/dein_lazy.toml',         {'lazy': 1})
    call dein#load_toml('~/.vim/rc/dein_languagepack.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

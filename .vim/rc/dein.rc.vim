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
    let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/'

    let s:dein_toml = s:base_dir . 'dein.toml'
    let s:dein_coc_toml = s:base_dir . 'dein_coc.toml'
    let s:dein_lazy_toml = s:base_dir . 'dein_lazy.toml'
    let s:dein_languagepack_toml = s:base_dir . 'dein_languagepack.toml'

    call dein#begin('~/.cache/dein', [expand('<sfile>'), s:dein_toml, s:dein_coc_toml, s:dein_lazy_toml, s:dein_languagepack_toml])

    call dein#load_toml(s:dein_toml,              {'lazy': 0})
    call dein#load_toml(s:dein_coc_toml,          {'lazy': 0})
    call dein#load_toml(s:dein_lazy_toml,         {'lazy': 1})
    call dein#load_toml(s:dein_languagepack_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, { _, val -> delete(val, 'rf') })
  call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax enable

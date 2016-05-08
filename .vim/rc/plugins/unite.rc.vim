let g:unite_source_menu_menus = {
\    'enc' : {
\        'description': '指定したエンコードでファイルを開き直します',
\        'command_candidates': [
\            ['utf8', 'e ++enc=utf-8'],
\            ['iso2022jp', 'e ++enc=iso2022jp'],
\            ['cp932', 'e ++enc=cp932'],
\            ['euc', 'e ++enc=euc'],
\            ['eucjp-ms', 'e ++enc=eucjp-ms'],
\            ['utf16', 'e ++enc=utf16'],
\            ['sjis', 'e ++enc=sjis'],
\            ['unicode', 'e ++enc=unicode'],
\        ]
\    },
\    'vimrc': {
\        'description': 'virmcを編集します',
\        'file_candidates': [
\            ['vimrc', '~/.vim/vimrc'],
\            ['dein.toml', '~/.vim/rc/dein.toml'],
\            ['dein_lazy.toml', '~/.vim/rc/dein_lazy.toml'],
\        ]
\    },
\    'zshrc': {
\        'description': 'virmcを編集します',
\        'file_candidates': [
\            ['zshrc', '~/.zsh/zshrc'],
\            ['zshrc.local', '~/.zsh/zshrc.local'],
\            ['zshenv.local', '~/.zsh/zshenv.local'],
\            ['zshenv', '~/.zsh/zshenv'],
\        ]
\    },
\}

if executable('ag')
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --ignore-case'
let g:unite_source_grep_recursive_opt = ''
endif


autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    nmap <buffer> <ESC>  <Plug>(unite_exit)
    imap <buffer> <C-c>  <Plug>(unite_exit)
    nmap <buffer> <C-c>  <Plug>(unite_exit)
    imap <buffer> jj     <Plug>(unite_insert_leave)
    imap <buffer>  <Tab> <Plug>(unite_complete)
    imap <buffer>  <BS>  <Plug>(unite_delete_backward_path)
    imap <buffer> '      <Plug>(unite_quick_match_default_action)
    nmap <buffer> '      <Plug>(unite_quick_match_default_action)
endfunction

nnoremap <Leader>cd :execute 'cd' unite#util#path2project_directory(getcwd())<CR>

nnoremap <silent> ,ub :<C-u>Unite buffer -start-insert<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file -start-insert<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru -start-insert<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

nnoremap <silent> ,uy :<C-u>Unite yankround<CR>

nnoremap <silent> ,ucg  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ug  :execute 'Unite' 'grep:'.unite#util#path2project_directory(getcwd()).' -buffer-name=search-buffer'<CR>
nnoremap <silent> ,/ucg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,/ug  :execute 'Unite' 'grep:'.unite#util#path2project_directory(getcwd()).' -buffer-name=search-buffer'<CR><C-R><C-W>

nnoremap <silent> ,m :<C-u>Unite menu -start-insert<CR>

" unite-outline
nnoremap <silent> ,uo :<C-u>Unite outline -start-insert<CR>

" tag jump.
nnoremap <silent><expr> tt  &filetype == 'help' ?  "g\<C-]>" :
\ ":\<C-u>UniteWithCursorWord -buffer-name=tag -immediately
\  tag tag/include\<CR>"
nnoremap <silent><expr> tp  &filetype == 'help' ?
\ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"


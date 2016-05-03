"----------------------------------------
" neocomplcache
"----------------------------------------

" タブキーで補完
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" 補完ウィンドウが正しく閉じられるようにする
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" 自動的に開始
" 自動補完は無効
" let g:neocomplcache_disable_auto_complete = 1
" 自動保管を行う入力数
let g:neocomplcache_auto_completion_start_length = 4
" バッファの補完を3文字目から開始
let g:neocomplcache_min_keyword_length = 4
" シンタックスファイルからの補完を4文字目から開始
let g:neocomplcache_min_syntax_length = 4
" 大文字が入力されるまで大文字小文字を区別しない
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバー補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" 候補の最大数
let g:neocomplcache_max_list = 10

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

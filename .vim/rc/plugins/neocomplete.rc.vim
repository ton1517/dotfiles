"----------------------------------------
" neocomplete
"----------------------------------------

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

let g:neocomplete#max_list = 10
let g:neocomplete#auto_completion_start_length = 4
let g:neocomplete#min_keyword_length = 4
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case  = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#skip_auto_completion_time = '0.2'
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

set completeopt-=preview

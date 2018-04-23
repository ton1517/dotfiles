"----------------------------------------
" deoplete
"----------------------------------------

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"

call deoplete#custom#option('max_list', 20)
call deoplete#custom#option('camel_case', v:true)
"
set completeopt-=preview

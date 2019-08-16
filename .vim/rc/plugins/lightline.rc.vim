"----------------------------------------
" lightline.vim
"----------------------------------------

let g:lightline = {
\       'colorscheme': 'onedark',
\       'separator': { 'left': '⮀', 'right': '⮂' },
\       'subseparator': { 'left': '⮁⮁', 'right': '⮃⮃' },
\       'active': {
\           'left': [ [ 'mode', 'paste' ], [ 'cocstatus', 'fugitive', 'filename' ] ],
\       },
\       'component_function': {
\           'fugitive': 'MyFugitive',
\           'filename': 'MyFilename',
\           'myreadonly': 'MyReadonly',
\           'cocstatus': 'coc#status',
\       },
\}

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! MyModified()
    return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%t') ? expand('%t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    return &ft !~? 'vimfiler' && exists("*fugitive#head") && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction



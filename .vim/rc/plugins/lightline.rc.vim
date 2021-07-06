"----------------------------------------
" lightline.vim
"----------------------------------------

let g:lightline = {
\ 'colorscheme': 'sonokai',
\ 'separator':            {'left': "\ue0b0", 'right': "\ue0b2"},
\ 'subseparator':         {'left': "\ue0b1", 'right': "\ue0b3"},
\ 'tabline_separator':    {'left': "\ue0b0", 'right': "\ue0b2"},
\ 'tabline_subseparator': {'left': "\ue0b1", 'right': "\ue0b3"},
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     ['filename'],
\     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
\   ],
\   'right':[
\     [ 'lineinfo' ],
\     [ 'percent' ],
\     ['gitbranch', 'fileformat', 'fileencoding', 'filetype'],
\     ['coc_status']
\   ],
\ },
\ 'component_function': {
\     'gitbranch': 'MyGitBranch',
\     'filename': 'MyFilename',
\     'coc_status': 'coc#status',
\     'filetype': 'MyFiletype',
\     'fileformat': 'MyFileformat',
\ },
\ 'component_expand': {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\  'linter_checking': 'right',
\  'linter_infos': 'right',
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\  'linter_ok': 'right',
\ }
\}

function! s:IsSpecialType()
    return &buftype == 'terminal' || &filetype =~ '\v(help|vimfiler|defx|unite)'
endf

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! MyModified()
    return s:IsSpecialType() ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return !s:IsSpecialType() && &ro ? '' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \ '' != expand('%t') ? expand('%t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyGitBranch()
    let l:branch = FugitiveHead()
    return !s:IsSpecialType() && l:branch != '' ? l:branch.' ' : ''
endfunction

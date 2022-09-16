vim.cmd([[
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

let g:ale_disable_lsp = 1

let g:ale_sign_error = "\uf05e"
let g:ale_sign_warning = "\uf071"
let g:ale_sign_column_always = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'go': ['golint', 'govet', 'golangci-lint'],
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'json': ['jq'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint', 'stylelint']
\ }

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'dart': ['dart-format'],
\   'go': ['goimports'],
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'json': ['jq'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint', 'stylelint']
\}

let g:ale_dart_format_options = '--line-length 140'
let g:ale_go_golangci_lint_options = ''
]])

local M = {}

M.setup = function()
end

M.config = function()
	vim.cmd([[
	augroup go
		autocmd!
		autocmd FileType go nmap <leader>t  <Plug>(go-test-func)
		autocmd FileType go nmap <leader>a  <Plug>(go-alternate-edit)
		autocmd FileType go nmap <leader>av  <Plug>(go-alternate-vertical)
		autocmd FileType go nmap <leader>as  <Plug>(go-alternate-split)
	augroup END
	let g:go_list_type = "quickfix"

	let g:go_gopls_enabled = 0
	let g:go_fmt_autosave = 0
	let g:go_def_mapping_enabled = 0
	let g:go_doc_keywordprg_enabled = 0

	" highlight
	let g:go_fold_enable = []

	" tagbar settings for golang
	let g:tagbar_type_go = {
		\ 'ctagstype' : 'go',
		\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'n:interfaces',
			\ 't:types',
			\ 'c:constants',
			\ 'v:variables',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
		\ ],
		\ 'sro' : '.',
		\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
		\ },
		\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
		\ },
		\ 'ctagsbin'  : 'gotags',
		\ 'ctagsargs' : '-sort -silent'
	\ }
	]])
end

return M

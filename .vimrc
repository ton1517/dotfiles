"---------------------------------------------------------------------------
" plugin settings
"---------------------------------------------------------------------------

"----------------------------------------
" NeoBundle
"----------------------------------------
set nocompatible
filetype off

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"--------------------
" my plugins

" NeoBundle
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
" unite
NeoBundle 'git://github.com/Shougo/unite.vim.git'
" unite-outline
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
" neocomplcache
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
" neocomplcache-snippets-complete
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
" vimfiler
NeoBundle 'git://github.com/Shougo/vimfiler.git'
" vim-quickrun
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
" vim-fugitive
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
" YankRing
NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
" Indent-Guides
NeoBundle 'git://github.com/vim-scripts/Indent-Guides.git'
" tComment
NeoBundle 'git://github.com/vim-scripts/tComment.git'
" sudo.vim
NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
" surround.vim
NeoBundle 'git://github.com/tpope/vim-surround.git'
" NERDTree.vim
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
" vim-powerline
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
" vim-easymotion
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'

"--------------------

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
echomsg 'Not installed bundles : ' .
     \ string(neobundle#get_not_installed_bundle_names())
echomsg 'Please execute ":NeoBundleInstall" command.'
endif

"----------------------------------------
" unite
"----------------------------------------

" インサートモードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"----------------------------------------
" unite-outline
"----------------------------------------

" ソースの関数一覧表示
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
" ソースの関数一覧を上下分割で常に表示
nnoremap <silent> ,uho :<C-u>Unite -winheight=15 -no-quit outline<CR>
" ソースの関数一覧を左右分割で常に表示
nnoremap <silent> ,uvo :<C-u>Unite -vertical -winwidth=25 -no-quit outline<CR>

"----------------------------------------
" neocomplcache
"----------------------------------------

" 自動的に開始
let g:neocomplcache_enable_at_startup = 1
" バッファの補完を2文字目から開始
let g:neocomplcache_min_keyword_length = 2
" シンタックスファイルからの補完を２文字目から開始
let g:neocomplcache_min_syntax_length = 2
" アンダーバー補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" タブキーで補完
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完ウィンドウが正しく閉じられるようにする
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"----------------------------------------
" neocomplcache-snippets-complete
"----------------------------------------

let g:neocomplcache_snippets_dir = '~/.vim/snippets'
imap <C-j> <plug>(neocomplcache_snippets_expand)
smap <C-j> <plug>(neocomplcache_snippets_expand)

"----------------------------------------
" vimfile
"----------------------------------------

" vimfilerをデフォルトのファイラーとする
let g:vimfiler_as_default_explorer = 1

"----------------------------------------
" YankRing
"----------------------------------------

" 履歴の保存ファイルを指定
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
" 最大保存件数
let g:yankring_max_history = 100
" 重複を許可しない
let g:yankring_ignore_duplicate = 1
" ウィンドウの高さ
let g:yankring_window_height = 20 
" F7でYRShowを実行
:nnoremap <silent> <F7> :YRShow<CR>

"----------------------------------------
" indent-guides
"----------------------------------------

" ハイライトをデフォルトで有効
let g:indent_guides_enable_on_vim_startup = 1
" 自動的なカラーをオフに
let g:indent_guides_auto_colors = 1
" ハイライトのサイズを小さく
let g:indent_guides_guide_size = 1
"----------------------------------------
" NERDTree
"----------------------------------------

" ,nt でNERDTreeを開く
nnoremap <silent> ,nt :NERDTreeToggle<CR>

"----------------------------------------
" vim-powerline
"----------------------------------------
" 正しく表示するにはvim-powerline用のパッチフォントを生成すること
" https://github.com/Lokaltog/vim-powerline

let g:Powerline_symbols='fancy'
set t_Co=256

"---------------------------------------------------------------------------
" vim settings
"---------------------------------------------------------------------------

"Windowsのランタイムパスを他のOSのパスに合わせる
:set runtimepath+=$HOME/.vim,$HOME/.vim/after

"ファイルを開いたらそのファイルのディレクトリに移動する
au   BufEnter *   execute ":lcd " . expand("%:p:h") 

"外部で変更があった場合自動的にファイルを読みなおす
set autoread
"頻繁に読み直すように
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

"----------------------------------------
" search settings
"----------------------------------------

"検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
"両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" インクリメンタルサーチ
set incsearch 

"----------------------------------------
" edit settings
"----------------------------------------

" タブの画面上での幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをスペースに展開する
set expandtab
" 自動的にインデントする
set autoindent
set smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 括弧入力時に対応する括弧を表示
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1	" ぶら下り可能幅
" ビープ音を鳴らさないように
set visualbell

"----------------------------------------
" display settings
"----------------------------------------

syntax on
" カラー設定
colorscheme desert
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

"----------------------------------------
" backup settings
"----------------------------------------

" バックアップファイルを指定したフォルダに作成する
set backupdir=$HOME/.vim/.backup
" スワップファイルを指定したフォルダに作成する
let &directory=&backupdir

"バックアップフォルダがなければ作成する
if isdirectory(&directory) == 0
	echo "make backup directory"
	echo &directory
	call mkdir(&directory)
endif
"----------------------------------------
" encoding settings 
"----------------------------------------

if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
end

if has('iconv')
let s:enc_euc = 'euc-jp'
let s:enc_jis = 'iso-2022-jp'

" iconvがeucJP-msに対応しているかをチェック
if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'eucjp-ms'
let s:enc_jis = 'iso-2022-jp-3'
" iconvがJISX0213に対応しているかをチェック
elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
let s:enc_euc = 'euc-jisx0213'
let s:enc_jis = 'iso-2022-jp-3'
endif

" fileencodingsを構築
if &encoding ==# 'utf-8'
let s:fileencodings_default = &fileencodings
let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
let &fileencodings = &fileencodings .','. s:fileencodings_default
unlet s:fileencodings_default
else

let &fileencodings = &fileencodings .','. s:enc_jis
set fileencodings+=utf-8,ucs-2le,ucs-2

if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
set fileencodings+=cp932
set fileencodings-=euc-jp
set fileencodings-=euc-jisx0213
set fileencodings-=eucjp-ms
let &encoding = s:enc_euc
let &fileencoding = s:enc_euc
else
let &fileencodings = &fileencodings .','. s:enc_euc
endif
endif

" 定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif

"--------------------
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
function! AU_ReCheck_FENC()
if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
let &fileencoding=&encoding
endif
endfunction

autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"--------------------
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
set ambiwidth=double
endif

local keymap = vim.keymap.set

-- セミコロンでコマンドラインモードに入る
keymap('n', ';', ':')

-- 移動をちょっと早く
keymap({ 'n', 'v' }, '<C-j>', '5j')
keymap({ 'n', 'v' }, '<C-k>', '5k')

-- 行頭、行末にジャンプ
keymap({ 'n', 'v' }, '<C-h>', '^')
keymap({ 'n', 'v' }, '<C-l>', '$')

-- ノーマルモード時にOで改行
keymap('n', 'O', 'o<ESC>')

-- hlsearchのハイライトを消去
keymap('n', '<ESC>', ':nohlsearch<CR><ESC>')

-- Ctrl-sで保存
keymap({ 'i', 'n' }, '<C-s>', '<Esc>:w<CR>')

-- 折り返されたテキストを自然に移動
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- ウィンドウ関連操作
keymap('n', 's', '<Nop>')
keymap('n', 'ss', '<C-w>s')
keymap('n', 'sv', '<C-w>v')
keymap('n', 'sj', '<C-w>j')
keymap('n', 'sk', '<C-w>k')
keymap('n', 'sl', '<C-w>l')
keymap('n', 'sh', '<C-w>h')
keymap('n', 'sJ', '<C-w>J')
keymap('n', 'sK', '<C-w>K')
keymap('n', 'sL', '<C-w>L')
keymap('n', 'sH', '<C-w>H')

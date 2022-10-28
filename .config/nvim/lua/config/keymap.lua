local keymap = vim.keymap.set
local opt = { silent = true }

-- セミコロンでコマンドラインモードに入る
keymap("n", ";", ":", opt)

-- 行頭、行末にジャンプ
keymap({ "n", "v" }, "<C-h>", "^", opt)
keymap({ "n", "v" }, "<C-l>", "$", opt)

-- ノーマルモード時にOで改行
keymap("n", "O", "o<ESC>", opt)

-- hlsearchのハイライトを消去
keymap("n", "<ESC>", ":nohlsearch<CR><ESC>", opt)

-- Ctrl-sで保存
keymap({ "i", "n" }, "<C-s>", "<Esc>:w<CR>", opt)

-- 折り返されたテキストを自然に移動
keymap("n", "j", "gj", opt)
keymap("n", "k", "gk", opt)

-- ウィンドウ関連操作
keymap("n", "s", "<Nop>", opt)
keymap("n", "ss", "<C-w>s", opt)
keymap("n", "sv", "<C-w>v", opt)
keymap("n", "sj", "<C-w>j", opt)
keymap("n", "sk", "<C-w>k", opt)
keymap("n", "sl", "<C-w>l", opt)
keymap("n", "sh", "<C-w>h", opt)
keymap("n", "sJ", "<C-w>J", opt)
keymap("n", "sK", "<C-w>K", opt)
keymap("n", "sL", "<C-w>L", opt)
keymap("n", "sH", "<C-w>H", opt)

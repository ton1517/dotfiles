local keymap = vim.keymap.set

-- セミコロンでコマンドラインモードに入る
keymap({ "n", "v" }, ";", ":", { noremap = true })

-- 行頭、行末にジャンプ
keymap({ "n", "v" }, "<C-h>", "^", { noremap = true })
keymap({ "n", "v" }, "<C-l>", "$", { noremap = true })

-- ノーマルモード時にOで改行
keymap("n", "O", "o<ESC>", { noremap = true })

-- hlsearchのハイライトを消去
keymap("n", "<ESC>", ":nohlsearch<CR><ESC>", { noremap = true, silent = true })

-- Ctrl-sで保存
keymap({ "i", "n" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- 折り返されたテキストを自然に移動
keymap("n", "j", "gj", { noremap = true })
keymap("n", "k", "gk", { noremap = true })

-- ウィンドウ関連操作
keymap("n", "s", "<Nop>", { noremap = true })
keymap("n", "ss", "<C-w>s", { noremap = true })
keymap("n", "sv", "<C-w>v", { noremap = true })
keymap("n", "sj", "<C-w>j", { noremap = true })
keymap("n", "sk", "<C-w>k", { noremap = true })
keymap("n", "sl", "<C-w>l", { noremap = true })
keymap("n", "sh", "<C-w>h", { noremap = true })
keymap("n", "sJ", "<C-w>J", { noremap = true })
keymap("n", "sK", "<C-w>K", { noremap = true })
keymap("n", "sL", "<C-w>L", { noremap = true })
keymap("n", "sH", "<C-w>H", { noremap = true })

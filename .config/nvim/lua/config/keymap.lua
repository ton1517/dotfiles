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

if not vim.g.vscode then
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
end

-- プロジェクトルートからのパスをクリップボードにコピー
keymap("n", "<leader>cp", function()
	-- 現在のファイルの絶対パスを取得
	local filepath = vim.fn.expand("%:p")

	-- Gitのルートディレクトリを優先的に取得
	local git_root = vim.fn.system(
		"git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel 2>/dev/null"
	)
	git_root = git_root:gsub("\n", "")

	local root
	if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
		root = git_root
	else
		-- Gitルートが見つからない場合は現在の作業ディレクトリを使用
		root = vim.fn.getcwd()
	end

	-- rootが/で終わっていない場合は追加
	if not root:match("/$") then
		root = root .. "/"
	end

	-- 相対パスを計算
	local relative_path = filepath
	if filepath:sub(1, #root) == root then
		relative_path = filepath:sub(#root + 1)
	end

	-- クリップボードにコピー
	vim.fn.setreg("+", relative_path)
	vim.notify("Copied: " .. relative_path)
end, { noremap = true, silent = true, desc = "Copy relative path to clipboard" })

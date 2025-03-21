local keymap = vim.keymap.set
local opt = { noremap = true }

-- ウィンドウ関連操作
keymap("n", "ss", "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>", opt)
keymap("n", "sv", "<Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>", opt)
keymap("n", "sj", "<Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>", opt)
keymap("n", "sk", "<Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>", opt)
keymap("n", "sl", "<Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>", opt)
keymap("n", "sh", "<Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>", opt)
keymap("n", "sJ", "<Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>", opt)
keymap("n", "sK", "<Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>", opt)
keymap("n", "sL", "<Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>", opt)
keymap("n", "sH", "<Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>", opt)

-- 検索関連操作
keymap("n", ",fg", "<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>", opt)
keymap("v", ",fG", "<Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': @\" })<CR>", opt)

-- コードアクション
keymap("n", ",ca", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", opt)

-- シンボルリネーム
keymap("n", ",rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>", opt)

-- 定義へ移動
keymap("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", opt)

-- 参照を表示
keymap("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>", opt)

-- 型定義へ移動
keymap("n", "gt", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>", opt)

-- 実装へ移動
keymap("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", opt)

-- ホバー表示（関数やクラスの情報）
keymap("n", "K", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>", opt)

-- コードのフォーマット
keymap("n", "<S-f>", "<Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", opt)
keymap("v", "<S-f>", "<Cmd>call VSCodeNotify('editor.action.formatSelection')<CR>", opt)

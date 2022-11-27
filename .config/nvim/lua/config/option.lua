local fn = vim.fn
local opt = vim.opt
local g = vim.g

opt.laststatus = 3
opt.updatetime = 100
opt.shortmess:append({ c = true })
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.cindent = true
opt.showmatch = true
opt.formatoptions = "tcqmMro"
opt.visualbell = true
opt.number = true
opt.list = true
opt.listchars = "tab:|-,extends:⇢,precedes:⇠,trail:»"
opt.cmdheight = 2
opt.title = true
opt.pumheight = 20
opt.signcolumn = "yes"
opt.cursorline = true
opt.fileformats = "unix,dos,mac"
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
-- インクリメント時の挙動 デフォでは0や0xで始まる数字は8進，16進とみなされる
-- 16進のみ許可し，他の数字は10進として扱う．
opt.nf = "hex"
-- 画面端まで行かなくてもスクロールできる
opt.scrolloff = 10
-- インデントで折りたたみ
opt.foldmethod = "indent"
opt.foldlevel = 99
-- clipboard
opt.clipboard = "unnamed"
-- no backup
opt.writebackup = false
opt.swapfile = false
-- disable conceal
opt.conceallevel = 0
opt.concealcursor = ""
-- true color
opt.termguicolors = true
if (not fn.has("gui_running")) and (g["&term"] ~= "screen" and g["&term"] ~= "tmux") then
	g["&t_8f"] = "<Esc>[38;2;%lu;%lu;%lum"
	g["&t_8b"] = "<Esc>[48;2;%lu;%lu;%lum"
end

-- メッセージにsourceとcodeを表示する
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
})

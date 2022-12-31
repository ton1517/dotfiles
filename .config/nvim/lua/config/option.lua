local fn = vim.fn
local g = vim.g

vim.opt.laststatus = 3
vim.opt.updatetime = 100
vim.opt.shortmess:append({ c = true })
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cindent = true
vim.opt.showmatch = true
vim.opt.formatoptions = "tcqmMro"
vim.opt.visualbell = true
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = "tab:|-,extends:⇢,precedes:⇠,trail:»"
vim.opt.cmdheight = 0
vim.opt.title = true
vim.opt.pumheight = 20
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.fileformats = "unix,dos,mac"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.breakindent = true
-- インクリメント時の挙動 デフォでは0や0xで始まる数字は8進，16進とみなされる
-- 16進のみ許可し，他の数字は10進として扱う．
vim.opt.nf = "hex"
-- 画面端まで行かなくてもスクロールできる
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
-- インデントで折りたたみ
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
-- clipboard
vim.opt.clipboard = "unnamed"
-- no backup
vim.opt.writebackup = false
vim.opt.swapfile = false
-- disable conceal
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
-- true color
vim.opt.termguicolors = true
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

-- show diagnostic sign with icon.
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

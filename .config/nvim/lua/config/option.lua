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
vim.opt.title = true
vim.opt.pumheight = 20
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
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

-- cmdheight
vim.opt.cmdheight = 0
local augroup = vim.api.nvim_create_augroup("CmdheihgtOnRecodring", {})
vim.api.nvim_create_autocmd("RecordingEnter", {
	group = augroup,
	callback = function()
		vim.opt.cmdheight = 1
	end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
	group = augroup,
	callback = function()
		vim.opt.cmdheight = 0
	end,
})

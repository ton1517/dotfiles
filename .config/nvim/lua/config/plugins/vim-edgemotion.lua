return {
	-- Move to the edge!
	"haya14busa/vim-edgemotion",
	keys = {
		{ "<Plug>(edgemotion-", mode = "" },
	},
	init = function()
		local opt = { silent = true }
		vim.keymap.set("", "<C-j>", "<Plug>(edgemotion-j)", opt)
		vim.keymap.set("", "<C-k>", "<Plug>(edgemotion-k)", opt)
	end,
}

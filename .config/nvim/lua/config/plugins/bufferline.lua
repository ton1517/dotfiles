return {
	-- A snazzy bufferline for Neovim
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufAdd",

	init = function()
		local keymap = vim.keymap.set
		local opt = { noremap = true, silent = true }
		keymap("n", "[b", "<CMD>BufferLineCyclePrev<CR>", opt)
		keymap("n", "]b", "<CMD>BufferLineCycleNext<CR>", opt)
		keymap("n", "bg", "<CMD>BufferLinePick<CR>", opt)
		keymap("n", "bp", "<CMD>BufferLineTogglePin<CR>", opt)

		for i = 1, 9 do
			keymap("n", ("b%s"):format(i), ("<cmd>lua require('bufferline').go_to_buffer(%s, true)<cr>"):format(i), opt)
		end
	end,

	config = function()
		require("bufferline").setup({
			options = {
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, _, _)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				show_buffer_close_icons = false,
				tab_size = 5,
				offsets = {
					{
						filetype = "neo-tree",
						text = "neo-tree",
						highlight = "Directory",
						separator = true,
					},
				},
				custom_filter = function(buf_number)
					return not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true)
				end,
			},
		})
	end,
}

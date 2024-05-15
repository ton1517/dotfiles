return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	event = { "BufReadPre", "BufNewFile" },

	init = function()
		vim.keymap.set("n", "<leader>ccq", function()
			local input = vim.fn.input("Quick Chat: ")
			if input ~= "" then
				require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
			end
		end, { noremap = true, silent = true, desc = "CopilotChat - Quick chat" })
	end,

	config = function()
		require("CopilotChat").setup({})
	end,
}

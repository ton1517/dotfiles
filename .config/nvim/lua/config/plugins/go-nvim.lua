return {
	-- A modern go neovim plugin based on treesitter, nvim-lsp and dap debugger.
	"ray-x/go.nvim",
	dependencies = "williamboman/mason.nvim",
	ft = "go",
	enabled = false,

	config = function()
		local path = require("mason-core.path")
		local cmd_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" })
		require("go").setup({
			gopls_cmd = { cmd_root_dir .. "/go/gopls" },
		})
	end,
}

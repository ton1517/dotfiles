local M = {}

M.setup = function() end

M.config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				winbar = { "neo-tree" },
			},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { "aerial" },
		winbar = {
			lualine_a = { "filename" },
			lualine_b = { "diagnostics" },
			lualine_c = { "aerial" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = { "filename" },
			lualine_b = { "diagnostics" },
			lualine_c = { "aerial" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	})
end

return M

return {
	{
		-- Text objects for indented blocks of lines
		"kana/vim-textobj-indent",
		dependencies = { "kana/vim-textobj-user" },
		-- keys = {
		-- 	{ "ii", mode = { "o", "x" } },
		-- 	{ "iI", mode = { "o", "x" } },
		-- 	{ "ai", mode = { "o", "x" } },
		-- 	{ "aI", mode = { "o", "x" } },
		-- },
	},
	{
		-- Text objects for the current line
		"kana/vim-textobj-line",
		dependencies = { "kana/vim-textobj-user" },
		-- keys = {
		-- 	{ "il", "<Plug>(textobj-line-i)", mode = { "o", "v" } },
		-- 	{ "al", "<Plug>(textobj-line-a)", mode = { "o", "v" } },
		-- },
	},
	{
		-- provide text objects (a, and i, by default) to select parameters of functions.
		"sgur/vim-textobj-parameter",
		dependencies = { "kana/vim-textobj-user" },
		-- keys = {
		-- 	{ "i,", mode = { "o", "x" } },
		-- 	{ "a,", mode = { "o", "x" } },
		-- },
	},
}

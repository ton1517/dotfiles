return {
	{
		-- Text objects for indented blocks of lines
		"kana/vim-textobj-indent",
		event = { "ModeChanged" },
		dependencies = { "kana/vim-textobj-user" },
	},
	{
		-- Text objects for the current line
		"kana/vim-textobj-line",
		event = { "ModeChanged" },
		dependencies = { "kana/vim-textobj-user" },
	},
	{
		-- provide text objects (a, and i, by default) to select parameters of functions.
		"sgur/vim-textobj-parameter",
		event = { "ModeChanged" },
		dependencies = { "kana/vim-textobj-user" },
	},
}

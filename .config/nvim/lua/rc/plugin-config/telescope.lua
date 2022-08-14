local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--no-ignore-dot",
            "--hidden",
            "-g=!.git/",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-d>"] = actions.delete_buffer,
            },
            n = {
                ["<C-c>"] = actions.close,
                ["q"] = actions.close,
            },
        },
    },
    extensions = {
        frecency = {
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
            disable_devicons = false,
            default_workspace = 'CWD',
        },
    },
}

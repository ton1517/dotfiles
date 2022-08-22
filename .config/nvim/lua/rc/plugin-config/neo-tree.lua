require("neo-tree").setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
        git_status = {
            symbols = {
                deleted   = "✖",
                renamed   = "",
                untracked = "?",
                ignored   = "/",
                unstaged  = "*",
                staged    = "o",
                conflict  = "",
            }
        },
    },
    window = {
        position = "left",
        width = 35,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = true,
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["S"] = "none",
            ["s"] = "none",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["h"] = "close_node",
            ["l"] = "open",
            ["e"] = "open",
            ["a"] = {
                "add",
                config = {
                    show_path = "none" -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
        }
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
            never_show = {
                ".DS_Store",
                "thumbs.db",
                ".git",
            },
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
    }
})
local M = {}

M.setup = function()
end

M.config = function()
    local keymap = vim.keymap.set
    keymap('n', ',e', '<cmd>Lspsaga show_line_diagnostics<cr>')
    keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
    keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

    keymap('n', ',rn', '<cmd>Lspsaga rename<CR>')

    keymap('n', 'gh', "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>")

    keymap('n', ',ca', '<cmd>Lspsaga code_action<CR>')
    keymap('v', ',ca', ':<C-u>Lspsaga range_code_action<CR>')

    keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
    keymap('n', '?', '<cmd>Lspsaga signature_help<cr>')

    keymap('n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
    keymap('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")

    local lspsaga = require 'lspsaga'
    lspsaga.setup { -- defaults ...
        debug = false,
        use_saga_diagnostic_sign = true,
        -- diagnostic sign
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
        diagnostic_header_icon = "   ",
        -- code action title icon
        code_action_icon = " ",
        code_action_prompt = {
            enable = true,
            sign = false,
            virtual_text = false,
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10,
        finder_action_keys = {
            open = "<CR>",
            vsplit = "s",
            split = "i",
            quit = "<ESC>",
            scroll_down = "<C-d>",
            scroll_up = "<C-u>",
        },
        code_action_keys = {
            quit = "<ESC>",
            exec = "<CR>",
        },
        rename_action_keys = {
            quit = "<ESC>",
            exec = "<CR>",
        },
        definition_preview_icon = "  ",
        border_style = "single",
        rename_prompt_prefix = "➤",
        rename_output_qflist = {
            enable = false,
            auto_open_qflist = false,
        },
        server_filetype_map = {},
        diagnostic_prefix_format = "%d. ",
        diagnostic_message_format = "%m %c",
        highlight_prefix = false,
    }
end

return M

local map = vim.api.nvim_set_keymap
map('n', '[b', '<Plug>(cokeline-focus-prev)', { silent = true })
map('n', ']b', '<Plug>(cokeline-focus-next)', { silent = true })
for i = 1, 9 do
    map('n', ('b%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
    map('n', ('bs%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end

local get_hex = require('cokeline/utils').get_hex
local comments_fg = get_hex('Comment', 'fg')
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

local components = {
    space = {
        text = ' ',
        truncation = { priority = 1 }
    },

    separator = {
        text = function(buffer)
            return (buffer.is_focused and ' ')
                or (buffer.filetype == 'neo-tree' and '  ')
                or (buffer.index ~= 1 and ' ▎')
                or '  '
        end,
        bg = get_hex('Normal', 'bg'),
        truncation = { priority = 1 }
    },

    number = {
        text = function(buffer)
            return buffer.index
        end,
        fg = comments_fg,
        truncation = { priority = 1 }
    },

    devicon = {
        text = function(buffer)
            return buffer.devicon.icon
        end,
        fg = function(buffer)
            return buffer.devicon.color
        end,
        truncation = { priority = 2 }
    },

    unique_prefix = {
        text = function(buffer)
            return buffer.unique_prefix
        end,
        fg = comments_fg,
        style = 'italic',
        truncation = {
            priority = 3,
            direction = 'left',
        },
    },

    filename = {
        text = function(buffer)
            return buffer.filename
        end,
        fg = function(buffer)
            return buffer.is_focused and '#78dce8' or nil
        end,
        style = function(buffer)
            return buffer.is_focused and 'bold,underline' or nil
        end,
        truncation = {
            priority = 2,
            direction = 'left',
        },
    },

    diagnostics = {
        text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
                or ''
        end,
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
        end,
        truncation = { priority = 1 },
    },

    close_or_unsaved = {
        text = function(buffer)
            return buffer.is_modified and '●' or ''
        end,
        fg = function(buffer)
            return buffer.is_modified and warnings_fg or nil
        end,
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
    },
}

require('cokeline').setup({
    buffers = {
        new_buffers_position = 'next',
    },
    rendering = {
        max_buffer_width = 50,
    },
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused
                and get_hex('Normal', 'fg')
                or get_hex('Comment', 'fg')
        end,
        bg = function(buffer)
            return buffer.is_focused and '#404040' or nil
        end
    },
    sidebar = {
        filetype = 'neo-tree',
        components = {
            components.separator,
            components.space,
            { text = 'neo-tree' },
        }
    },
    components = {
        components.separator,
        components.space,
        components.number,
        components.space,
        components.devicon,
        components.space,
        components.unique_prefix,
        components.filename,
        components.diagnostics,
        components.space,
        components.close_or_unsaved,
        components.space,
    },
})

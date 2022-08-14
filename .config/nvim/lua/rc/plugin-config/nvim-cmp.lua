local sources = {
    nvim_lsp = {
        name = 'nvim_lsp',
        max_item_count = 10,
    },
    cmp_tabnine = {
        name = 'cmp_tabnine',
        max_item_count = 5,
    },
    luasnip = { name = 'luasnip' },
    path = { name = 'path' },
    buffer = { name = 'buffer' },
    look = {
        name = 'look',
        keyword_length = 3,
        max_item_count = 10,
        option = {
            convert_case = true,
            loud = true,
        },
    },
    cmdline = { name = 'cmdline' },
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            with_text = true,
            menu = {
                buffer = '[Buffer]',
                cmp_tabnine = '[TabNine]',
                luasnip = '[LuaSnip]',
                nvim_lsp = '[LSP]',
                path = '[Path]',
                look = '[Look]',
            },
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        sources.nvim_lsp,
        sources.cmp_tabnine,
        sources.luasnip,
        sources.path,
    }, {
        sources.buffer,
        sources.look,
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        sources.buffer,
    })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        sources.path,
    }, {
        sources.cmdline,
    })
})

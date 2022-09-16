local M = {}

M.setup = function()
end

M.config = function()
    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    vim.api.nvim_set_keymap('n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_set_keymap('n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_set_keymap('n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    vim.api.nvim_set_keymap('n', '<S-f>', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

    local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    end

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup_handlers {
        function(server_name)
            local opts = {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            if server_name == "sumneko_lua" then
                opts.settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                    }
                }
            end

            require('lspconfig')[server_name].setup(opts)
        end
    }
end

return M

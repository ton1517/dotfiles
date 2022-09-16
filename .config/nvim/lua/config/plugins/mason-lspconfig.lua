local M = {}

M.setup = function()
end

M.config = function()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "clangd",
            "dockerls",
            "gopls",
            "graphql",
            "html",
            "jsonls",
            "tsserver",
            "taplo",
            "terraformls",
            "tflint",
            "volar",
            "cssls",
            "yamlls",
            "bashls",
            "sumneko_lua",
        }
    })
end

return M

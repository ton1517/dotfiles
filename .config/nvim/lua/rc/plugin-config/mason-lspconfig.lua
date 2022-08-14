require("mason-lspconfig").setup({
    ensure_installed = {
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

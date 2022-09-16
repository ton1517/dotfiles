local M = {}

M.setup = function()
end

M.config = function()
    require("mason").setup({
        automatic_installation = true,
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end

return M

local M = {}

M.setup = function()
end

M.config = function()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return M

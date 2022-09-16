local packer = nil
local packer_bootstrap = false

local function init()
  if packer == nil then
    packer_bootstrap = require('config.packer.util').ensure_packer()
    packer = require('packer')
    packer.init {
      max_jobs = 30,
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "rounded" })
        end,
      },
    }
  end

  packer.reset()

  package.loaded['config.plugins'] = nil
  require('config.plugins')(packer.use)

  if packer_bootstrap then
    packer.sync()
  end
end

init()

return packer

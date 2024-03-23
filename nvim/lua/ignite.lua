-- [nfnl] Compiled from fnl/ignite.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local plugins = autoload("plugins")
local function setup()
  plugins.setup()
  require("general")
  require("config.fidget")
  require("config.gitsigns")
  require("config.lualine")
  require("config.treesitter")
  return nil
end
return {setup = setup}

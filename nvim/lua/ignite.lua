-- [nfnl] Compiled from fnl/ignite.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function lazy_setup()
  local lazy = autoload("lazy")
  return lazy.setup("plugins")
end
local function setup()
  lazy_setup()
  require("general")
  require("config.cmp")
  require("config.treesitter")
  require("keymaps")
  return nil
end
return {setup = setup}

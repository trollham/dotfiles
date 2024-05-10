-- [nfnl] Compiled from fnl/plugins/oil.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function _2_()
  vim.keymap.set({"n"}, "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
  local oil = autoload("oil")
  return oil.setup()
end
return {"stevearc/oil.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _2_}

-- [nfnl] Compiled from fnl/plugins/catppuccin.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function _2_()
  local catppuccin = autoload("catppuccin")
  catppuccin.setup({flavour = "frappe", integrations = {treesitter = true, gitsigns = true}})
  vim.cmd.colorscheme("catppuccin")
  return nil
end
return {"catppuccin/nvim", name = "catppuccin", priority = 1000, config = _2_, lazy = false}

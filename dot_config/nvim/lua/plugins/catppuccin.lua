-- [nfnl] fnl/plugins/catppuccin.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function _2_(opts)
  local catppuccin = autoload("catppuccin")
  catppuccin.setup(opts)
  vim.cmd.colorscheme("catppuccin")
  return nil
end
return {"catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {flavour = "auto", integrations = {treesitter = true, gitsigns = true, fidget = true, noice = true, treesitter_context = true, lsp_trouble = true, which_key = true}}, config = _2_, lazy = false}

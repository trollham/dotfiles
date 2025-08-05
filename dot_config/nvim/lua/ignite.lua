-- [nfnl] fnl/ignite.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function lazy_setup()
  local lazy = autoload("lazy")
  return lazy.setup("plugins")
end
local function setup()
  lazy_setup()
  require("general")
  require("keymaps")
  return nil
end
vim.lsp.config("*", {capabilities = vim.lsp.protocol.make_client_capabilities()})
local function _2_(client, bufnr)
  local navic = require("nvim-navic")
  return navic.attach(client, bufnr)
end
vim.g.rustaceanvim = {server = {on_attach = _2_}}
return {setup = setup}

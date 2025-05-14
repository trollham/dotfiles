-- [nfnl] fnl/ignite.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function lazy_setup()
  local lazy = autoload("lazy")
  return lazy.setup("plugins")
end
local function mason_setup()
  do
    local mason = autoload("mason")
    mason.setup()
  end
  local mason_lsp = autoload("mason-lspconfig")
  return mason_lsp.setup({ensure_installed = {"rust_analyzer", "lua_ls"}})
end
local function setup()
  lazy_setup()
  require("general")
  require("config.treesitter")
  require("keymaps")
  return nil
end
vim.lsp.config("*", {capabilities = vim.lsp.protocol.make_client_capabilities()})
return {setup = setup}

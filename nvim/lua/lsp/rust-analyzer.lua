-- [nfnl] Compiled from fnl/lsp/rust-analyzer.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lsp_config = autoload("lspconfig")
do
  local r_a = {setup = {settings = {["rust-analyzer"] = {diagnostics = {enable = false}}}}}
  lsp_config["rust_analyzer"] = r_a
end
return {}

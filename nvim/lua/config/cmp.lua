-- [nfnl] Compiled from fnl/config/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local cmp = autoload("cmp")
local cmp_lsp = autoload("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities()
return {setup = setup, capabilites = capabailites}

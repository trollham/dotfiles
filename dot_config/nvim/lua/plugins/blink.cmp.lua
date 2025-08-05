-- [nfnl] fnl/plugins/blink.cmp.fnl
local function _1_()
  local b = require("blink.cmp")
  return not b.snippet_active({direction = 1})
end
return {"Saghen/blink.cmp", dependencies = {"rafamadriz/friendly-snippets", "saghen/blink.compat"}, version = "1.*", opts = {keymap = {preset = "super-tab"}, completion = {list = {selection = {preselect = _1_}}}, sources = {default = {"lsp", "path", "snippets", "buffer"}}, fuzzy = {implementation = "prefer_rust_with_warning"}}, lazy = false}

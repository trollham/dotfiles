-- [nfnl] Compiled from fnl/config/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local cmp = autoload("cmp")
local cmp_lsp = autoload("cmp_nvim_lsp")
local luasnip = autoload("luasnip")
local capabilities = cmp_lsp.default_capabilities()
local function setup()
  local function _2_(args)
    return luasnip.lsp_expand(args.body)
  end
  do local _ = {expand = _2_} end
  local function _3_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.locally_jumpable(1) then
      return luasnip.jump(1)
    else
      return fallback()
    end
  end
  local function _5_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.locally_jumpable(-1) then
      return luasnip.jump(-1)
    else
      return fallback()
    end
  end
  cmp.mapping.preset.insert({["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}), ["<Tab>"] = cmp.mapping(_3_, {i = "s"}), ["<S-Tab>"] = cmp.mapping(_5_, {i = "s"})})
  return {{name = "nvim_lsp"}, {name = "nvim_lsp_signature_help"}, {name = "luasnip"}}
end
return {setup = setup, capabilities = capabilities}

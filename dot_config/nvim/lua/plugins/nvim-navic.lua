-- [nfnl] fnl/plugins/nvim-navic.fnl
local function _1_()
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  return nil
end
return {"SmiteshP/nvim-navic", config = _1_}

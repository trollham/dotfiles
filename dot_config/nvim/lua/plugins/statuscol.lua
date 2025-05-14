-- [nfnl] Compiled from fnl/plugins/statuscol.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function _2_()
  local statuscol = autoload("statuscol")
  local builtin = autoload("statuscol.builtin")
  local icons = autoload("user.icons")
  local git_sign_icon = icons.line.left_medium
  local cfg = {bt_ignore = nil, clickhandlers = {Lnum = builtin.gitsigns_click}, clickmod = "c", ft_ignore = nil, relculright = true, segments = {{sign = {name = {".*"}, namespace = {".*"}, maxwidth = 1, colwidth = 2, wrap = true, auto = false}}, {text = {builtin.lnumfunc, " "}, colwidth = 1, click = "v:lua.ScLa"}, {text = {builtin.foldfunc, " "}, hl = "FoldColumn", wrap = true, colwidth = 1, click = "v:lua.ScFa"}, {sign = {name = {"GitSigns*"}, namespace = {"gitsigns"}, colwidth = 1, fillchar = git_sign_icon, fillcharhl = "NrLine"}, click = "v:lua.ScSa"}}, thousands = ","}
  return statuscol.setup(cfg)
end
return {"luukvbaal/statuscol.nvim", config = _2_}

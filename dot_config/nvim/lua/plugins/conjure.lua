-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  do
    local cm = require("conjure.main")
    cm.main()
  end
  local cmap = require("conjure.mapping")
  return cmap["on-filetype"]()
end
local function _2_()
end
return {"Olical/conjure", ft = {"clojure", "fennel"}, lazy = true, config = _1_, init = _2_}

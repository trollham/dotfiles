-- [nfnl] after/lsp/lua_ls.fnl
local function _1_(client, bufnr)
  do
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
  end
  return print("lua_ls attached")
end
return {settings = {Lua = {runtime = {version = "LuaJIT"}, diagnostics = {globals = {"vim", "require"}}}}, on_attach = _1_}

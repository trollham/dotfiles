-- [nfnl] after/lsp/rust_analyzer.fnl
local function _1_()
  return print("rust_analyzer attached")
end
return {on_attach = _1_, settings = {[{"rust_analyzer"}] = {cargo = {features = "all"}, check = {command = "clippy"}, interpret = {tests = true}}}}

-- [nfnl] after/lsp/fennel_language_server.fnl
local function _1_()
  return print("fennel_language_server attached")
end
return {settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}, on_attach = _1_}

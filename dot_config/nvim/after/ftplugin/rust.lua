-- [nfnl] after/ftplugin/rust.fnl
local bufnr = vim.api.nvim_get_current_buf()
local function _1_()
  return vim.cmd.RustLsp("codeAction")
end
vim.keymap.set("n", "gra", _1_, {silent = true, buffer = bufnr})
local function _2_()
  return vim.cmd.RustLsp({"hover", "actions"})
end
return vim.keymap.set("n", "K", _2_, {silent = true, buffer = bufnr})

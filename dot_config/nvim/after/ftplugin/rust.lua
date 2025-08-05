-- [nfnl] after/ftplugin/rust.fnl
local bufnr = vim.api.nvim_get_current_buf()
local function _1_()
  return vim.cmd.RustLsp("codeAction")
end
vim.keymap.set("n", "<leader>a", _1_, {silent = true, buffer = bufnr})
local function _2_()
  return vim.cmd.RustLsp({"hover", "actions"})
end
vim.keymap.set("n", "K", _2_, {silent = true, buffer = bufnr})
local function _3_()
  return vim.lsp.buf.format({async = true})
end
return vim.api.nvim_create_autocmd("BufWritePre", {buffer = bufnr, callback = _3_})

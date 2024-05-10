-- [nfnl] Compiled from fnl/lsp/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local function key_set(mode, key, f, opts)
  return vim.keymap.set(mode, key, f, opts)
end
local function nkey_set(key, f, opts)
  return key_set("n", key, f, opts)
end
local function ikey_set(key, f, opts)
  return key_set("i", key, f, opts)
end
local function on_attach(client, bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  nkey_set("gD", vim.lsp.buf.declaration, bufopts)
  nkey_set("gd", vim.lsp.buf.definition, bufopts)
  nkey_set("gi", vim.lsp.buf.implementation, bufopts)
  nkey_set("<C-k>", vim.lsp.buf.signature_help, bufopts)
  nkey_set("<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  nkey_set("<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  local function _1_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  nkey_set("<Leader>wl", _1_, bufopts)
  nkey_set("<Leader>D", vim.lsp.buf.type_definition, bufopts)
  local function _2_()
    return vim.lsp.buf.format({async = true})
  end
  nkey_set("<Leader>f", _2_, bufopts)
  return {}
end
return {on_attach = on_attach}

(fn key-set [mode key f opts]
  (vim.keymap.set mode key f opts))

(fn nkey-set [key f opts]
  (key-set :n key f opts))

(fn ikey-set [key f opts]
  (key-set :i key f opts))

(fn on_attach [client bufnr]
  (local bufopts {:noremap true :silent true :buffer bufnr})
  (nkey-set "gD" vim.lsp.buf.declaration bufopts)
  (nkey-set "gd" vim.lsp.buf.definition bufopts)
  (nkey-set "gi" vim.lsp.buf.implementation bufopts)
  (nkey-set "<C-k>" vim.lsp.buf.signature_help bufopts)
  (nkey-set "<Leader>wa" vim.lsp.buf.add_workspace_folder bufopts)
  (nkey-set "<Leader>wr" vim.lsp.buf.remove_workspace_folder bufopts)
  (nkey-set "<Leader>wl" (fn [] (print (vim.inspect (vim.lsp.buf.list_workspace_folders)))) bufopts)
  (nkey-set "<Leader>D" vim.lsp.buf.type_definition bufopts)
  (nkey-set "<Leader>f" (fn [] (vim.lsp.buf.format {:async true})) bufopts)
  {})

{: on_attach}

(let [bufnr (vim.api.nvim_get_current_buf)]
  (vim.keymap.set :n :<leader>a (fn []
                                  (vim.cmd.RustLsp :codeAction))
                  { :silent true :buffer bufnr})
  (vim.keymap.set :n :K (fn [] (vim.cmd.RustLsp [:hover :actions]))
                  { :silent true :buffer bufnr})
  (vim.api.nvim_create_autocmd :BufWritePre { :buffer bufnr :callback (fn [] (vim.lsp.buf.format {:async true }))})
  )

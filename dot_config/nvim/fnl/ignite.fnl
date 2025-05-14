(local {: autoload} (require :nfnl.module))

(fn lazy-setup []
  (let [lazy (autoload :lazy)]
    (lazy.setup :plugins)))

(fn mason-setup []
  (let [mason (autoload :mason)]
    (mason.setup))
  (let [mason-lsp (autoload :mason-lspconfig)]
    (mason-lsp.setup {:ensure_installed [:rust_analyzer :lua_ls]})))

(fn setup []
  (lazy-setup)
  (require :general)
  (require :config.treesitter)
  (require :keymaps)
  nil)

(vim.lsp.config "*" {
                     :capabilities (vim.lsp.protocol.make_client_capabilities)
                     })

{: setup}

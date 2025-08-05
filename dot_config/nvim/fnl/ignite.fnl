(local {: autoload} (require :nfnl.module))

(fn lazy-setup []
  (let [lazy (autoload :lazy)]
    (lazy.setup :plugins)))

(fn setup []
 (lazy-setup)
 (require :general)
 (require :keymaps)
 nil)

(vim.lsp.config "*" {:capabilities (vim.lsp.protocol.make_client_capabilities)})

(set vim.g.rustaceanvim {
                         :server {:on_attach (fn [client bufnr]
                                               (let [navic (require "nvim-navic")]
                                                 (navic.attach client bufnr)))}
                         })

{: setup}

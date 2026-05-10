(vim.lsp.config "*" {:capabilities (vim.lsp.protocol.make_client_capabilities)})
(vim.lsp.enable :fennel_ls)

(set vim.g.rustaceanvim
     {:server {:on_attach (fn [client bufnr]
                            (let [navic (require "nvim-navic")]
                              (navic.attach client bufnr)))}})

(require :options)
(require :keymaps)
(require :pack)

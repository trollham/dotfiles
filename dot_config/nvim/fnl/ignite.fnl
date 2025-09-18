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
     ;                         :tools { :test_executor "background" }
     :server {:on_attach (fn [client bufnr]
                           (let [navic (require "nvim-navic")]
                             (navic.attach client bufnr)))}
     })


; (local orig_util_open_floating_preview vim.lsp.util.open_floating_preview)
; (fn vim.lsp.util.open_floating_preview [contents syntax opts ...] 
;   (var opts (or opts {}))
;   (set opts.border :rounded)
;   (orig_util_open_floating_preview contents syntax opts ...))
(set vim.opt.winborder :rounded)

  (vim.pack.add ["https://github.com/j-hui/fidget.nvim" 
                 "https://github.com/lewis6991/gitsigns.nvim"
                 "https://github.com/neovim/nvim-lspconfig"
                 "https://github.com/mason-org/mason-lspconfig.nvim"
                 "https://github.com/mfussenegger/nvim-dap"
                 "https://github.com/rachartier/tiny-inline-diagnostic.nvim"
                 "https://github.com/atweiden/vim-fennel"
                 "https://github.com/tpope/vim-fugitive"
                 "https://github.com/tpope/vim-surround"
                 ])

{: setup}

(local {: autoload} (require :nfnl.module))
{1 :stevearc/oil.nvim
:dependencies {1 :nvim-tree/nvim-web-devicons }
:config (fn []
          (vim.keymap.set [:n] :- "<CMD>Oil<CR>" {:desc "Open parent directory"})
          (let [oil (autoload :oil)] 
            (oil.setup)))}

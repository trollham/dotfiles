{1 :nvim-neotest/neotest :dependencies [:nvim-neotest/nvim-nio
                                        :nvim-lua/plenary.nvim
                                        :antoinemadec/FixCursorHold.nvim
                                        :nvim-treesitter/nvim-treesitter]
 :config (fn [] 
           (let [neotest (require :neotest)]
             (neotest.setup { :adapters [
                                         (require :rustaceanvim.neotest)]}
                            )))
 :keys [
        (vim.keymap.set :n :<leader>R (fn [] 
                                        (let [neotest (require :neotest)]
                                          (neotest.run.run))) {:desc "Run nearest tests"})
        ]
 }

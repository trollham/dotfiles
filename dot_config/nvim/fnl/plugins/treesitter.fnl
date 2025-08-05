{1 :nvim-treesitter/nvim-treesitter
 :build ":TSUpdate"
 :lazy false
 :branch "main"
 ; :dependencies [:nvim-treesitter/nvim-treesitter-textobjects
 ;                :nvim-treesitter/nvim-treesitter-refactor 
 ;
 ;                 ] 

 :opts {:highlight { :enable true }
        :refactor { :enable true }
        :highlight_current_scope   { :enable  true } 
        :highlight_definitions { :enable true }
        :ensure_isntalled [
                           :bash
                           :c
                           :dockerfile
                           :fennel
                           :git_config
                           :git_rebase
                           :gitattributes
                           :gitcommit
                           :gitignore
                           :markdown
                           :lua
                           :python
                           :query
                           :rust
                           :toml
                           :vim
                           :vimdoc
                           :yaml
                           ]
        }
 :config (fn [_ opts] 
           (local ts (require :nvim-treesitter))
           (ts.setup)
           (ts.install opts.ensure_installed)
           (vim.api.nvim_create_autocmd "Filetype" {
                                                    :pattern [
                                                              :c
                                                              :dockerfile
                                                              :fnl
                                                              :gitconfig
                                                              :git_rebase
                                                              :gitattributes
                                                              :gitcommit
                                                              :gitignore
                                                              :markdown
                                                              :lua
                                                              :python
                                                              :query
                                                              :rs
                                                              :sh
                                                              :toml
                                                              :vim
                                                              :vimdoc
                                                              :yaml
                                                              ]
                                                    :callback (fn [] 
                                                                (local ok (pcall vim.treesitter.start))
                                                                (when (not ok)
                                                                  (print "Treesitter not enabling")
                                                                  ))}))}

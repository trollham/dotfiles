(import-macros {: pack : pack! : unpack!} :macro.pack)
(local {: map!} (require :keymaps))

(pack! :saghen/blink.lib)
(pack! :saghen/blink.cmp {:version (vim.version.range "^1")
                          :setup (fn []
                                   (let [blink (require :blink.cmp)]
                                    ; (: (blink.build) :wait 60000)
                                     (blink.setup {:keymap {:preset :super-tab}
                                                   :completion {:list {:selection {:preselect (fn []
                                                                            (not (blink.snippet_active {:direction 1})))}}}})))})

(pack! :catppuccin/nvim
       {:name :catppuccin
        :setup (fn []
                 (let [c (require :catppuccin)]
                   (c.setup {:flavour "auto"
                             :integrations {:treesitter true
                                            :gitsigns true
                                            :fidget true
                                            :noice true
                                            :treesitter_context true
                                            :lsp_trouble true
                                            :which_key true}})
                   (vim.cmd.colorscheme :catppuccin)))})

(pack! :stevearc/conform.nvim
       {:setup (fn []
                 (local conform (require :conform))
                 (conform.setup))})

(pack! :saecki/crates.nvim
       {:setup (fn []
                 (vim.api.nvim_create_autocmd :BufRead
                                              {:pattern :Cargo.toml
                                               :once true
                                               :callback (fn [_] 
                                                  (local crates (require :crates))
                                                  (crates.setup))}))})

(pack! :mfussenegger/nvim-dap
       {:setup (fn []
                 (map! [:n :v] :<F1>
                       (fn []
                         (let [widgets (require :dap.ui.widgets)]
                           (widgets.hover)))
                       {:desc "DAP Hover"}))})

(pack! :j-hui/fidget.nvim {:setup (fn [] (local fidget (require :fidget))
                                    (fidget.setup))})

(pack! :rafamadriz/friendly-snippets)

(pack! :MrcJkb/haskell-tools.nvim)
(pack! :nvim-lualine/lualine.nvim)
(pack! :williamboman/mason.nvim
       {:setup (fn []
                 (local mason (require :mason))
                 (mason.setup))})
(pack! :williamboman/mason-lspconfig.nvim
       {:setup (fn []
                 (local ml (require :mason-lspconfig))
                 (ml.setup {:ensure_installed [:fennel_ls :lua_ls :hls]}))})


(pack! :nvim-mini/mini.nvim
       {:setup (fn []
                 ((. (require :mini.pairs) :setup))
                 ((. (require :mini.diff) :setup)))})


(pack! :neovim/nvim-lspconfig)
(pack! :SmiteshP/nvim-navic
       {:setup (fn []
                 (set vim.o.winbar
                      "%{%v:lua.require'nvim-navic'.get_location()%}"))})

(pack! :nvim-tree/nvim-web-devicons)
(pack! :stevearc/oil.nvim
       {:setup (fn []
                 (map! [:n] :- "<CMD>Oil<CR>"
                                 {:desc "Open parent directory"})
                 (let [oil (require :oil)]
                   (oil.setup {:view_options {:show_hidden true}})))})

(pack! :mrcjkb/rustaceanvim {:version (vim.version.range "^9")})
(pack! :folke/snacks.nvim
       {:setup (fn []
                 (local snacks (require :snacks))
                 (snacks.setup {:input {:enabled true} :picker {:enabled true}})
                 (map! [:n] :<leader>f
                                 (fn [] (Snacks.picker.smart))
                                 {:desc "Smart Find Files"})
                 (map! [:n] :<leader>g
                                 (fn [] (Snacks.picker.grep)) {:desc "Grep"})
                 (map! [:n] :<leader>b
                                 (fn [] (Snacks.picker.buffers))
                                 {:desc "Buffers"}))})

(pack! :nvim-treesitter/nvim-treesitter
       {:version :main
        :setup (fn []
                 (local ts (require :nvim-treesitter))
                 (local languages
                        [:css
                         :dockerfile
                         :fish
                         :html
                         :http
                         :javascript
                         :json
                         :lua
                         :python
                         :regex
                         :rust
                         :scss
                         :typescript
                         :vue
                         :yaml
                         :markdown
                         :bash
                         :c
                         :cmake
                         :comment
                         :cpp
                         :dart
                         :go
                         :jsdoc
                         :json5
                         :llvm
                         :make
                         :proto
                         :swift
                         :todotxt
                         :toml
                         :tsx
                         :vim
                         :vimdoc
                         :gitcommit
                         :git_rebase])
                 (ts.install languages)
                 (vim.api.nvim_create_autocmd :FileType
                                              {:callback (fn [ev]
                                                           (local bufnr ev.buf)
                                                           (local filetype
                                                                  (vim.api.nvim_get_option_value :filetype
                                                                                                 {:buf bufnr}))

                                                           (fn start-ts [parser-name]
                                                             (vim.treesitter.start bufnr
                                                                                   parser-name)
                                                             (set vim.wo.foldexpr
                                                                  "v:lua.vim.treesitter.foldexpr()")
                                                             (set vim.wo.foldmethod
                                                                  :expr)
                                                             (set vim.bo.indentexpr
                                                                  "v:lua.require'nvim-treesitter'.indentexpr()"))

                                                           (when (= filetype "")
                                                             (lua "return "))
                                                           (local parser-name
                                                                  (vim.treesitter.language.get_lang filetype))
                                                           (when (not parser-name)
                                                             (vim.notify (vim.inspect (.. "No treesitter parser found for filetype: "
                                                                                          filetype))
                                                                         vim.log.levels.WARN)
                                                             (tset (. vim.bo
                                                                      bufnr)
                                                                   :syntax :ON)
                                                             (lua "return "))
                                                           (local ts-config
                                                                  (require :nvim-treesitter.config))
                                                           (when (not (vim.tbl_contains (ts-config.get_available)
                                                                                        parser-name))
                                                             (lua "return "))
                                                           (local already-installed
                                                                  (ts-config.get_installed :parsers))
                                                           (when (not (vim.tbl_contains already-installed
                                                                                        parser-name))
                                                             (vim.notify (.. "Installing parser for "
                                                                             parser-name)
                                                                         vim.log.levels.INFO)
                                                             (: (ts.install [parser-name])
                                                                :await start-ts)
                                                             (lua "return "))
                                                           (start-ts parser-name))
                                               :desc "Enable Treesitter"
                                               :group (vim.api.nvim_create_augroup :enable_treesitter
                                                                                   {})}))})

(pack! :tpope/vim-fugitive)
(pack! :folke/which-key.nvim
       {:setup (fn []
                 (let [w (require :which-key)]
                   (w.setup)))})

(unpack!)

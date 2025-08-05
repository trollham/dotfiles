{1 :Saghen/blink.cmp
:lazy false
:dependencies [:rafamadriz/friendly-snippets :saghen/blink.compat]
:version :1.*
:opts {:keymap {:preset :super-tab}
       :completion {:list {:selection {:preselect (fn [] 
                      (let [b (require :blink.cmp)]  
                          (not (b.snippet_active {:direction 1}))))}}}
       :sources { :default [:lsp :path :snippets :buffer]}
       :fuzzy {:implementation "prefer_rust_with_warning"}}}

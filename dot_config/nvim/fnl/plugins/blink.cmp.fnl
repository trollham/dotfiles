{1 :Saghen/blink.cmp
:lazy false
:dependencies [:rafamadriz/friendly-snippets :saghen/blink.compat :agriffis/cmp-conjure]
:version :1.*
:opts {:keymap {:preset :super-tab}
       :sources { :default [:lsp :path :snippets :buffer :conjure]
                 :providers {:conjure {:name :conjure
                                       :module :blink.compat.source
                                       ;:kind :Conjure
                                       }} }
       :appearance {:kind_icons {:Conjure :🪄}}}}

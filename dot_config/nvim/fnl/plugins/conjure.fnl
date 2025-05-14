{1 :Olical/conjure
 :ft [:clojure :fennel]
 :lazy true
 :config (fn [_ opts]
           (let [cm (require :conjure.main)] 
             (cm.main))
           (let [cmap (require :conjure.mapping)] 
             (cmap.on-filetype)))
 :init (fn [] 
         ;(set vim.g.conjure#debug true)
         )
}

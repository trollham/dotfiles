(local {: autoload} (require :nfnl.module))

(fn lazy-setup []
  (let [lazy (autoload :lazy)]
    (lazy.setup :plugins)))

(fn setup []
  (lazy-setup)
  (require :general)
  (require :config.cmp)
  (require :config.treesitter)
  (require :keymaps)
  nil)

{: setup}


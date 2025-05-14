(local {: autoload} (require :nfnl.module))

{1 :catppuccin/nvim 
:name "catppuccin" 
:lazy false 
:priority 1000 
;:opts { :flavour "frappe" 
;:integrations { :treesitter true 
;:gitsigns true }} 
:config (fn [] 
          (local catppuccin (autoload :catppuccin)) 
          (catppuccin.setup { :flavour "frappe" 
                            :integrations { :treesitter true 
                            :gitsigns true }})
          (vim.cmd.colorscheme :catppuccin)
          nil)
}


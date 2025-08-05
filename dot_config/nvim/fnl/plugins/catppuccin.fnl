(local {: autoload} (require :nfnl.module))

{1 :catppuccin/nvim 
:name "catppuccin" 
:lazy false 
:priority 1000 
:opts { :flavour "auto" 
      :integrations { :treesitter true 
                      :gitsigns true 
                      :fidget true
                      :noice true
                      :treesitter_context true
                      :lsp_trouble true
                      :which_key true}} 
:config (fn [opts] 
         (local catppuccin (autoload :catppuccin)) 
         (catppuccin.setup opts)
         (vim.cmd.colorscheme :catppuccin)
         nil)
}


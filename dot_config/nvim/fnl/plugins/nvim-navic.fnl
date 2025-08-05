{1 :SmiteshP/nvim-navic 
 :config (fn [] 
           (set vim.o.winbar  "%{%v:lua.require'nvim-navic'.get_location()%}"))}

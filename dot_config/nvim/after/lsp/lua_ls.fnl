{ :settings {
             :Lua {
                   :runtime { :version "LuaJIT" } 
                   :diagnostics {:globals ["vim" "require"]}}}
 :on_attach (fn [client bufnr]
              (let [navic (require "nvim-navic")]
                (navic.attach client bufnr))
              (print "lua_ls attached")) }

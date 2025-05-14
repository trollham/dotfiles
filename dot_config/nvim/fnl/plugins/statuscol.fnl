(local {: autoload} (require :nfnl.module))
; local builtin = require("statuscol.builtin")
; local cfg = {
;   setopt = true,         -- Whether to set the 'statuscolumn' option, may be set to false for those who
;                          -- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
;                          -- Although I recommend just using the segments field below to build your
;                          -- statuscolumn to benefit from the performance optimizations in this plugin.
;   -- builtin.lnumfunc number string options
;   thousands = false,     -- or line number thousands separator string ("." / ",")
;   relculright = false,   -- whether to right-align the cursor line number with 'relativenumber' set
;   -- Builtin 'statuscolumn' options
;   ft_ignore = nil,       -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
;   bt_ignore = nil,       -- Lua table with 'buftype' values for which 'statuscolumn' will be unset
;   -- Default segments (fold -> sign -> line number + separator), explained below
;   segments = {
;     { text = { "%C" }, click = "v:lua.ScFa" },
;     { text = { "%s" }, click = "v:lua.ScSa" },
;     {
;       text = { builtin.lnumfunc, " " },
;       condition = { true, builtin.not_empty },
;       click = "v:lua.ScLa",
;     }
;   },
;   clickmod = "c",         -- modifier used for certain actions in the builtin clickhandlers:
;                           -- "a" for Alt, "c" for Ctrl and "m" for Meta.
;   clickhandlers = {       -- builtin click handlers, keys are pattern matched
;     Lnum                    = builtin.lnum_click,
;     FoldClose               = builtin.foldclose_click,
;     FoldOpen                = builtin.foldopen_click,
;     FoldOther               = builtin.foldother_click,
;     DapBreakpointRejected   = builtin.toggle_breakpoint,
;     DapBreakpoint           = builtin.toggle_breakpoint,
;     DapBreakpointCondition  = builtin.toggle_breakpoint,
;     ["diagnostic/signs"]    = builtin.diagnostic_click,
;     gitsigns                = builtin.gitsigns_click,
;   },
; }
{1 :luukvbaal/statuscol.nvim
 :config (fn [] 
           (local statuscol (autoload :statuscol))
           (local builtin (autoload :statuscol.builtin)) 
           (local icons (autoload :user.icons))
           (local git_sign_icon icons.line.left_medium)
           (local cfg {
                       :bt_ignore nil 
                       :clickhandlers {
                                       ; :DapBreakpoint builtin.toggle_breakpoint 
                                       ; :DapBreakpointCondition builtin.toggle_breakpoint 
                                       ; :DapBreakpointRejected builtin.toggle_breakpoint 
                                       ; :FoldClose builtin.foldclose_click 
                                       ; :FoldOpen builtin.foldopen_click 
                                       ; :FoldOther builtin.foldother_click 
                                       ; :Lnum builtin.lnum_click 
                                       ; :diagnostic/signs builtin.diagnostic_click 
                                       ; :gitsigns builtin.gitsigns_click
                                       :Lnum builtin.gitsigns_click
                                       } 
                       :clickmod :c 
                       :ft_ignore nil 
                       :relculright true 
                       :segments [
                                  {:sign {:name [ ".*" ] 
                                          :namespace [ ".*" ] 
                                         ; :namespace = { ".*diagnostic.*" } 
                                         ; :name = { "todo%-sign.*" }, -- WARN: escape the dash `-` 
                                         :maxwidth 1 
                                         :colwidth 2 
                                         :auto false 
                                         :wrap true }}
                                  {:text [builtin.lnumfunc " "]
                                   :colwidth 1
                                   :click "v:lua.ScLa"}
                                  {:text [builtin.foldfunc " "]
                                   :hl "FoldColumn"
                                   :wrap true
                                   :colwidth 1 
                                   :click "v:lua.ScFa"}
                                  {:sign {
                                          :name [:GitSigns*]
                                          :namespace [:gitsigns]
                                          :colwidth 1
                                          :fillchar git_sign_icon
                                          :fillcharhl "NrLine"
                                          }
                                   :click "v:lua.ScSa"}] 
                       ; :setopt true 
                       :thousands ","})	
           (statuscol.setup cfg))}

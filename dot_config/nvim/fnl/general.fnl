; treesitter folding
(local termgui? (vim.fn.has :termguicolors))

; (when termgui?
; 	(set vim.opt.termguicolors true))
(when termgui?
  (set _G.vim.opt.termguicolors true))

(vim.cmd.syntax :enable)

; Set completeopt to have a better completion experience
; :help completeopt
; menuone: popup even when there's only one match
; noinsert: Do not insert text until a selection is made
; noselect: Do not select, force user to select one from the menu
(set vim.opt.completeopt "menuone,noinsert,noselect")

(vim.opt.shortmess:append :c)

(set vim.opt.diffopt :vertical)
(set vim.opt.background :dark)

; display line numbers
(set vim.opt.number true)

; time for vim to process swapfile updates and CursorHold events
(set vim.opt.updatetime 250)

; if hidden is not set, TextEdit might fail.
(set vim.opt.hidden true)

; set all true tabs and shifts (<</>>) to be 4 columns wide
(set vim.opt.tabstop 4)
(set vim.opt.softtabstop 4)
(set vim.opt.shiftwidth 4)
(set vim.opt.breakindent true)
(set vim.opt.signcolumn "yes:1")
(set vim.opt.numberwidth 3)

; Better display for messages
(set vim.opt.cmdheight 2)
; customize diagnostics output. This removes symbols in favor of coloring the line number.
(vim.diagnostic.config { :virtual_lines {:current_line true}
                        :signs {:text {vim.diagnostic.severity.ERROR ""
                                       vim.diagnostic.severity.WARN "" }
                                :numhl { vim.diagnostic.severity.WARN "WarningMsg"
                                        vim.diagnostic.severity.ERROR "ErrorMsg"
                                        vim.diagnostic.severity.INFO "InfoMsg"}}})

(set vim.opt.fillchars {:foldopen ""
                        :foldclose ""
                        :fold " "
                        :foldsep " "
                        :diff "/"
                        :eob " "})

(set vim.opt.foldcolumn "1")
(set vim.opt.smoothscroll true)
(set vim.opt.foldexpr "v:lua.vim.treesitter.foldexpr()")
(set vim.opt.foldmethod "expr")
(set vim.opt.foldtext "")
(set vim.opt.foldlevel 0)
(set vim.opt.foldenable false)

; (fn get_fold [lnum] 
;   (let [fcs (vim.opt.fillchars:get)]
;     (if (<= (vim.fn.foldlevel lnum) (vim.fn.foldlevel (- lnum 1))) 
;       " "
;       (or (and (= (vim.fn.foldclosed lnum) (- 1)) fcs.foldopen) fcs.foldclose))))
;
; (fn _G.get_statuscol [] (.. "%s" (get_fold vim.v.lnum) "%l " ))
; (set vim.opt.statuscolumn "%!v:lua.get_statuscol()")
(set vim.opt.statuscolumn "%l%s")
{ }

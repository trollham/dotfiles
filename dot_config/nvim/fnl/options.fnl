(import-macros {: set!} :macro.set)

;; ─────────────────
;; Interface options
;; ─────────────────
(local termgui? (vim.fn.has :termguicolors))
(when termgui?
  (set! termguicolors))

; Better display for messages
(set! cmdheight 2)
; highlight cursorline
(set! cul)
(set! winborder :rounded)
(set! diffopt :vertical)
(set! background :dark)
(set! number)
(set! scrolloff 3)

(vim.cmd.syntax :enable)

; Set completeopt to have a better completion experience
; :help completeopt
; menuone: popup even when there's only one match
; noinsert: Do not insert text until a selection is made
; noselect: Do not select, force user to select one from the menu
(set! completeopt "menuone,noinsert,noselect")
(set! shortmess+ :c)
(set! noruler)

; time for vim to process swapfile updates and CursorHold events
(set! updatetime 250)

; if hidden is not set, TextEdit might fail.
(set! hidden)

; set all true tabs and shifts (<</>>) to be 4 columns wide
(set! tabstop 4)
(set! softtabstop 4)
(set! shiftwidth 4)
(set! smartindent)
(set! breakindent)
(set! timeout)
(set! timeoutlen 300)
(set! expandtab)
(set! signcolumn :auto)

; customize diagnostics output. This removes symbols in favor of coloring the line number.
(vim.diagnostic.config {:virtual_text {}
                        :signs {:text {vim.diagnostic.severity.ERROR ""
                                       vim.diagnostic.severity.WARN ""}
                                :numhl {vim.diagnostic.severity.WARN "WarningMsg"
                                        vim.diagnostic.severity.ERROR "ErrorMsg"
                                        vim.diagnostic.severity.INFO "InfoMsg"}}})

(set! fillchars {:foldopen ""
                 :foldclose ""
                 :fold " "
                 :foldsep " "
                 :diff "/"
                 :eob " "})

(set! foldcolumn "1")
(set! smoothscroll)
(set! foldexpr "v:lua.vim.treesitter.foldexpr()")
(set! foldmethod :expr)
(set! foldtext "")
(set! foldlevel 0)
(set! nofoldenable)

(set! statuscolumn "%l%s")
{}

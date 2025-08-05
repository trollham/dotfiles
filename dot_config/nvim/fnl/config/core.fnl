; treesitter folding
(set vim.opt.foldmethod "expr")
(local termgui? (vim.fn.has :termguicolors))
(when termgui?
	(set vim.opt.termguicolors true))
(vim.cmd.syntax :enable)
; Set completeopt to have a better completion experience
; :help completeopt
; menuone: popup even when there's only one match
; noinsert: Do not insert text until a selection is made
; noselect: Do not select, force user to select one from the menu
(set vim.opt.completeopt "menuone,noinsert,noselect")
(vim.opt.shortmess:append :c)

(set vim.opt.foldexpr "nvim_treesitter#foldexpr()")
(set vim.opt.foldenable false)
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
(set expandtab on)

(set vim.opt.breakindent true)
(set vim.opt.signcolumn "number")
; Better display for messages
(set vim.opt.cmdheight 2)


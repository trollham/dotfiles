require('plugins')
-- vim variable assignments I don't know work in lua
vim.cmd [[
colorscheme sonokai

" enable syntax highlighting
syntax enable

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use our horizontal real estate to show the 3-way diff
set diffopt+=vertical]] 

-- Allows folding (z<movement>) to recognize syntax folding rules, i.e. folding
-- on braces for C/C++
vim.opt.foldmethod = 'syntax'

-- Set text to be unfolded by default
vim.opt.foldenable = false

-- use system clipboard
--vim.opt.clipboard = 'unnamedplus'

-- display line numbers
vim.opt.number = true 

-- if hidden is not set, TextEdit might fail.
vim.opt.hidden = true

-- set all true tabs and shifts (<</>>) to be 4 columns wide
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Better display for messages
vim.opt.cmdheight = 2

-- display signs in the line number column
vim.opt.signcolumn = 'number'
require('remaps')
require('gitsigns').setup()
require('lualine').setup {
	options = {
		theme = 'nord'
	}
}

-- [nfnl] Compiled from fnl/general.fnl by https://github.com/Olical/nfnl, do not edit.
vim.opt.foldmethod = "expr"
local termgui_3f = vim.fn.has("termguicolors")
if termgui_3f then
  _G.vim.opt.termguicolors = true
else
end
vim.cmd.syntax("enable")
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess:append("c")
vim.opt.diffopt = "vertical"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldcolumn = "1"
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.hidden = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true
vim.opt.cmdheight = 2
vim.diagnostic.config({virtual_lines = {current_line = true}})
return {}

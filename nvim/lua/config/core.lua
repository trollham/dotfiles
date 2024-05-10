-- [nfnl] Compiled from fnl/config/general.fnl by https://github.com/Olical/nfnl, do not edit.
vim.opt.foldmethod = "expr"
local termgui_3f = vim.fn.has("termguicolors")
if termgui_3f then
  vim.opt.termguicolors = true
else
end
vim.cmd.syntax("enable")
vim.opt.completeopt = "menuone,noinsert,noselect"
do end (vim.opt.shortmess):append("c")
vim.opt.diffopt = "vertical"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.hidden = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true
vim.opt.signcolumn = "number"
vim.opt.cmdheight = 2
return nil

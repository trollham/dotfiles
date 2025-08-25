-- [nfnl] fnl/general.fnl
local termgui_3f = vim.fn.has("termguicolors")
if termgui_3f then
  _G.vim.opt.termguicolors = true
else
end
vim.cmd.syntax("enable")
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess:append("c")
vim.opt.diffopt = "vertical"
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.hidden = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true
vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 3
vim.opt.cmdheight = 2
vim.diagnostic.config({virtual_text = {}, signs = {text = {[vim.diagnostic.severity.ERROR] = "", [vim.diagnostic.severity.WARN] = ""}, numhl = {[vim.diagnostic.severity.WARN] = "WarningMsg", [vim.diagnostic.severity.ERROR] = "ErrorMsg", [vim.diagnostic.severity.INFO] = "InfoMsg"}}})
vim.opt.fillchars = {foldopen = "\239\145\188", foldclose = "\239\145\160", fold = " ", foldsep = " ", diff = "/", eob = " "}
vim.opt.foldcolumn = "1"
vim.opt.smoothscroll = true
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""
vim.opt.foldlevel = 0
vim.opt.foldenable = false
vim.opt.statuscolumn = "%l%s"
return {}

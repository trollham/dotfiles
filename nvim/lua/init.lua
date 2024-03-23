-- must be set before lazy.nvim 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local nfnl_path = vim.fn.stdpath 'data' .. '/lazy/nfnl'

if not vim.loop.fs_stat(nfnl_path) then
  print("Could not find nfnl, cloning new copy to", nfnl_path)
  vim.fn.system({'git', 'clone', 'https://github.com/Olical/nfnl', nfnl_path})
  vim.cmd('helptags ' .. nfnl_path .. '/docs')
end
vim.opt.rtp:prepend(nfnl_path)

require('nfnl').setup()
require("ignite").setup()

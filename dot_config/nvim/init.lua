-- mapleader keys must be set before lazy.nvim 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local plugins_path = vim.fn.stdpath("data") .. "/lazy/"
local function bootstrap(path, project)
  local path = plugins_path .. path
  if not vim.loop.fs_stat(path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/" .. project .. ".git",
      path,
    })
  end
  vim.opt.rtp:prepend(path)
end


bootstrap("lazy.nvim", "folke/lazy.nvim")
bootstrap("nfnl", "Olical/nfnl")

require("ignite").setup()

require("lspconfig").fennel_ls.setup({})

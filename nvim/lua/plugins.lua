-- [nfnl] Compiled from fnl/plugins.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lazy_path = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
local lazy_installed_3f = vim.loop.fs_stat(lazy_path)
local plugins_to_install
local function _2_()
  local catppuccin = autoload("catppuccin")
  catppuccin.setup({flavour = "frappe", integrations = {treesitter = true, gitsigns = true}})
  return vim.cmd.colorscheme("catppuccin")
end
local function _3_()
  return (vim.fn.executable("make") == 1)
end
local function _4_()
  local crates = autoload("crates")
  return crates.setup()
end
local function _5_()
  vim.keymap.set({"n"}, "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
  local oil = autoload("oil")
  return oil.setup()
end
plugins_to_install = {{"Olical/nfnl", ft = "fennel"}, "tpope/vim-commentary", "tpope/vim-fugitive", "tpope/vim-vinegar", {"neovim/nvim-lspconfig"}, {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}}, {"mrcjkb/rustaceanvim", ft = "rust"}, "j-hui/fidget.nvim", "lewis6991/gitsigns.nvim", {"nvim-lualine/lualine.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}}, {"catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {flavour = "frappe", integrations = {treesitter = true, gitsigns = true}}, config = _2_, lazy = false}, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects", "nvim-treesitter/nvim-treesitter-refactor"}}, "folke/trouble.nvim", {"nvim-telescope/telescope.nvim", version = "*", dependencies = {"nvim-lua/plenary.nvim"}}, {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _3_}, {"saecki/crates.nvim", config = _4_}, {"stevearc/oil.nvim", config = _5_}, "Olical/conjure", "PaterJason/cmp-conjure"}
local function setup()
  if not __fnl_global__packer_2dinstalled_3f then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazy_path})
  else
  end
  do end (vim.opt.rtp):prepend(lazy_path)
  local lazy = autoload("lazy")
  return lazy.setup(plugins_to_install)
end
return {setup = setup}

-- [nfnl] fnl/ignite.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local function lazy_setup()
  local lazy = autoload("lazy")
  return lazy.setup("plugins")
end
local function setup()
  lazy_setup()
  require("general")
  require("keymaps")
  return nil
end
vim.lsp.config("*", {capabilities = vim.lsp.protocol.make_client_capabilities()})
local function _2_(client, bufnr)
  local navic = require("nvim-navic")
  return navic.attach(client, bufnr)
end
vim.g.rustaceanvim = {server = {on_attach = _2_}}
vim.opt.winborder = "rounded"
vim.pack.add({"https://github.com/j-hui/fidget.nvim", "https://github.com/lewis6991/gitsigns.nvim", "https://github.com/neovim/nvim-lspconfig", "https://github.com/mason-org/mason-lspconfig.nvim", "https://github.com/mfussenegger/nvim-dap", "https://github.com/rachartier/tiny-inline-diagnostic.nvim", "https://github.com/atweiden/vim-fennel", "https://github.com/tpope/vim-fugitive", "https://github.com/tpope/vim-surround"})
return {setup = setup}

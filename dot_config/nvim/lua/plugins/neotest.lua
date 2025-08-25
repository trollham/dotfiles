-- [nfnl] fnl/plugins/neotest.fnl
local function _1_()
  local neotest = require("neotest")
  return neotest.setup({adapters = {require("rustaceanvim.neotest")}})
end
local function _2_()
  local neotest = require("neotest")
  return neotest.run.run()
end
return {"nvim-neotest/neotest", dependencies = {"nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim", "nvim-treesitter/nvim-treesitter"}, config = _1_, keys = {vim.keymap.set("n", "<leader>R", _2_, {desc = "Run nearest tests"})}}

-- [nfnl] fnl/plugins/telescope.fnl
local function _1_()
  return (vim.fn.executable("make") == 1)
end
return {{"nvim-telescope/telescope.nvim", branch = "master", dependencies = {"nvim-lua/plenary.nvim"}}, {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _1_}}

-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (vim.fn.executable("make") == 1)
end
return {{"nvim-telescope/telescope.nvim", version = "*", dependencies = {"nvim-lua/plenary.nvim"}}, {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _1_}}

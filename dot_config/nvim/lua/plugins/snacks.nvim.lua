-- [nfnl] fnl/plugins/snacks.nvim.fnl
local function _1_()
  return Snacks.picker.smart()
end
local function _2_()
  return Snacks.picker.grep()
end
local function _3_()
  return Snacks.picker.buffers()
end
return {"folke/snacks.nvim", priority = 1000, opts = {input = {enabled = true}, picker = {enabled = true}}, keys = {{"<leader>f", _1_, desc = "Smart Find Files"}, {"<leader>g", _2_, desc = "Grep"}, {"<leader>b", _3_, desc = "Buffers"}}, lazy = false}

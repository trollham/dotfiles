-- [nfnl] fnl/config/treesitter.fnl
local configs = require("nvim-treesitter.configs")
local ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "rust", "bash", "fennel"}
return configs.setup({ensure_installed = ensure_installed, highlight = {enable = true}, refactor = {enable = true}, highlight_definitions = {enable = true}})

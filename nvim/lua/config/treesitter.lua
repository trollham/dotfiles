-- [nfnl] Compiled from fnl/config/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local configs = require("nvim-treesitter.configs")
local ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "rust", "bash", "fennel"}
return configs.setup({ensure_installed = ensure_installed, highlight = {enable = true}, refactor = {enable = true}, highlight_definitions = {enable = true}})

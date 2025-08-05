-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_(_, opts)
  local ts = require("nvim-treesitter")
  ts.setup()
  ts.install(opts.ensure_installed)
  local function _2_()
    local ok = pcall(vim.treesitter.start)
    if not ok then
      return print("Treesitter not enabling")
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("Filetype", {pattern = {"c", "dockerfile", "fnl", "gitconfig", "git_rebase", "gitattributes", "gitcommit", "gitignore", "markdown", "lua", "python", "query", "rs", "sh", "toml", "vim", "vimdoc", "yaml"}, callback = _2_})
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", branch = "main", opts = {highlight = {enable = true}, refactor = {enable = true}, highlight_current_scope = {enable = true}, highlight_definitions = {enable = true}, ensure_isntalled = {"bash", "c", "dockerfile", "fennel", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "markdown", "lua", "python", "query", "rust", "toml", "vim", "vimdoc", "yaml"}}, config = _1_, lazy = false}

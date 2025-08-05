-- [nfnl] fnl/plugins/mason.fnl
return {{"williamboman/mason-lspconfig.nvim", dependencies = {"neovim/nvim-lspconfig", {"williamboman/mason.nvim", opts = {}}}, opts = {ensure_installed = {"fennel_language_server", "lua_ls"}}}}

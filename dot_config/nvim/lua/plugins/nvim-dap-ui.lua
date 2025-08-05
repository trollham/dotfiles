-- [nfnl] fnl/plugins/nvim-dap-ui.fnl
return {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}, opts = {}, keys = {{"<F12>", "<cmd>lua require\"dapui\".toggle()<cr>", desc = "nvim-dap-ui toggle"}}}

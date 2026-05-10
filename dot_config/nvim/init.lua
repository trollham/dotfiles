vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.pack.add({ { src = "https://github.com/rktjmp/hotpot.nvim", version = vim.version.range("^2.0.0") } })
require("hotpot")
require("ignite")

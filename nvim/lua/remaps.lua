function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map('n', shortcut, command)
end

function imap(shortcut, command)
	map('i', shortcut, command)
end

function tmap(shortcut, command)
	map('t', shortcut, command)
end

imap('jk', '<Esc>')
tmap("jk", "<C-\\><C-n>")

-- Easy switching between windows
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-l>", "<C-\\><C-N><C-w>l")

imap("<C-h>", "<C-\\><C-N><C-w>h")
imap("<C-j>", "<C-\\><C-N><C-w>j")
imap("<C-k>", "<C-\\><C-N><C-w>k")
imap("<C-l>", "<C-\\><C-N><C-w>l")

nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Remove highlights caused by searching
nmap("<C-x>", ":nohl<cr>")

-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
vim.keymap.set("n", "<C-f>", builtin.find_files, {})
vim.keymap.set("n", "<C-b>", builtin.buffers, {})

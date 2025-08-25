(lambda map [mode shortcut command]
 (vim.keymap.set mode shortcut command { :noremap true :silent true }))

(lambda nmap [shortcut command] 
 (map :n shortcut command))

(lambda imap [shortcut command]
  (map :i shortcut command))

(lambda tmap [shortcut command]
  (map :t shortcut command))

(imap :jk :<Esc>)
(tmap :jk "<C-\\><C-n>")

; Easy switching between windows
(tmap "<M-h>" "<C-\\><C-N><C-w>h")
(tmap "<M-j>" "<C-\\><C-N><C-w>j")
(tmap "<M-k>" "<C-\\><C-N><C-w>k")
(tmap "<M-l>" "<C-\\><C-N><C-w>l")

(imap "<M-h>" "<C-\\><C-N><C-w>h")
(imap "<M-j>" "<C-\\><C-N><C-w>j")
(imap "<M-k>" "<C-\\><C-N><C-w>k")
(imap "<M-l>" "<C-\\><C-N><C-w>l")

(nmap "<M-h>" "<C-w>h")
(nmap "<M-j>" "<C-w>j")
(nmap "<M-k>" "<C-w>k")
(nmap "<M-l>" "<C-w>l")
{ }

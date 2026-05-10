(λ map! [mode shortcut command]
  (vim.keymap.set mode shortcut command {:noremap true :silent true}))

(λ nmap! [shortcut command]
  (map! :n shortcut command))

(λ imap! [shortcut command]
  (map! :i shortcut command))

(λ tmap! [shortcut command]
  (map! :t shortcut command))

(imap! :jk :<Esc>)
(tmap! :jk "<C-\\><C-n>")

{: map!}

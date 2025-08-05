{:settings {:fennel {:diagnostics {:globals [:vim]}
                     :workspace {:library (vim.api.nvim_list_runtime_paths)}}}
 :on_attach (fn []
              (print "fennel_language_server attached"))}

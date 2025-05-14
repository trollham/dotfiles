{ :on_attach (fn []
               (print "rust_analyzer attached"))
 :settings {
            [:rust_analyzer] {:cargo {:features "all"}
                              :check {:command "clippy"}
                              :interpret {:tests true}} } }

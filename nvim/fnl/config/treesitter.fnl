(local configs (require :nvim-treesitter.configs))
(local ensure-installed  [:c
						  :lua
						  :vim
						  :vimdoc
						  :query
						  :rust
						  :bash
						  :fennel])
(configs.setup {:ensure_installed ensure-installed
				:highlight { :enable true }
				:refactor { :enable true }
		; :highlight_current_scope = { enable = true, } ,
				:highlight_definitions { :enable true }})


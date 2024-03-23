(local {: autoload} (require :nfnl.module))
(local plugins (autoload :plugins))

(fn setup []
  	(plugins.setup)
	(require :general)
	;(require :config.catppuccin)
	(require :config.fidget)
	(require :config.gitsigns)
	(require :config.lualine)
	(require :config.treesitter)
	nil)


{: setup}

(local {: autoload} (require :nfnl.module))
(local cmp (autoload :cmp)) 
(local cmp-lsp (autoload :cmp_nvim_lsp))
(local luasnip (autoload :luasnip))

(local capabilities (cmp-lsp.default_capabilities))


(fn setup []
	:snippet {
		:expand (fn [args]
			(luasnip.lsp_expand args.body))}
	:mapping (cmp.mapping.preset.insert {
		:<CR> (cmp.mapping.confirm {
			:behavior cmp.ConfirmBehavior.Replace
			:select true})
		:<Tab> (cmp.mapping (fn [fallback]
			(if (cmp.visible) 
			    (cmp.select_next_item)
			    (luasnip.locally_jumpable 1)
			    (luasnip.jump 1)
			    (fallback))) { :i :s })
		:<S-Tab> (cmp.mapping (fn [fallback]
			(if (cmp.visible) 
			(cmp.select_prev_item)
			(luasnip.locally_jumpable -1) 
			(luasnip.jump -1)
			(fallback))) { :i :s })
	})
	:sources [
		{ :name :nvim_lsp }
		{ :name :nvim_lsp_signature_help }
		{ :name :luasnip }
	]
    )

{: setup :capabilities capabilities}


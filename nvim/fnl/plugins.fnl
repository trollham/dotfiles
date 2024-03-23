(local {: autoload} (require :nfnl.module))

(local lazy-path (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(local lazy-installed? (vim.loop.fs_stat lazy-path))

(local plugins-to-install
	   [{1 :Olical/nfnl :ft :fennel}
		; movements for commenting code (using gc<movement>)
		:tpope/vim-commentary
		; Git extensions
		:tpope/vim-fugitive
		; netrw enhancements
		:tpope/vim-vinegar
		{1 :neovim/nvim-lspconfig
			; TODO :dependencies
			}
		{1 :hrsh7th/nvim-cmp
		:dependencies [:hrsh7th/cmp-nvim-lsp
					   :hrsh7th/cmp-nvim-lsp-signature-help
					   :L3MON4D3/LuaSnip
					   :saadparwaiz1/cmp_luasnip]}
		{1 :mrcjkb/rustaceanvim :ft :rust}
		:j-hui/fidget.nvim
		:lewis6991/gitsigns.nvim
	    ; TODO use { 'junegunn/fzf.vim', run = function() vim.fn["fzf#install"](0) end }
		{1 :nvim-lualine/lualine.nvim
			:dependencies [{1 :nvim-tree/nvim-web-devicons}]}
		{1 :catppuccin/nvim 
			:name "catppuccin" 
			:lazy false 
			:priority 1000 
			:opts {
					:flavour "frappe"
					:integrations {
						:treesitter true
						:gitsigns true }}
			:config (fn [] 
					(local catppuccin (autoload :catppuccin)) 
					(catppuccin.setup {
						:flavour "frappe"
						:integrations { :treesitter true 
										:gitsigns  true}})
					  (vim.cmd.colorscheme :catppuccin))
		}
		{1 :nvim-treesitter/nvim-treesitter
		   :build ":TSUpdate"
		   :dependencies [:nvim-treesitter/nvim-treesitter-textobjects
						   :nvim-treesitter/nvim-treesitter-refactor
				
		]}
		:folke/trouble.nvim
		{1 :nvim-telescope/telescope.nvim
		:version "*"
		:dependencies {1 :nvim-lua/plenary.nvim}}
		; Fuzzy Finder Algorithm which requires local dependencies to be built.
        ; Only load if `make` is available. Make sure you have the system
        ; requirements installed.
        {1 :nvim-telescope/telescope-fzf-native.nvim
         ; NOTE: If you are having trouble with this installation,
         ; refer to the README for telescope-fzf-native for more instructions.
         :build :make
         :cond (fn [] (= (vim.fn.executable :make) 1))}
		{1 :saecki/crates.nvim 
		 :config (fn [] 
				   (let [crates (autoload :crates)] 
					 (crates.setup)))}
		 {1 :stevearc/oil.nvim
			:config (fn []
					  (vim.keymap.set [:n] :- "<CMD>Oil<CR>" {:desc "Open parent directory"})
				      (let [oil (autoload :oil)] 
						(oil.setup)))}
	:Olical/conjure
	:PaterJason/cmp-conjure
	])

(fn setup []
  (when (not packer-installed?)
	(vim.fn.system [:git
					 :clone
					 "--filter=blob:none"
					 "https://github.com/folke/lazy.nvim.git"
					 "--branch=stable"
					 lazy-path]))
	(vim.opt.rtp:prepend lazy-path)
	(let [lazy (autoload :lazy)]
	  (lazy.setup plugins-to-install)))
{: setup}

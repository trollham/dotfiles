vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig' 
	
	-- autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'rstacruz/vim-closer'

	-- rust-analyzer add-ons
	use 'simrat39/rust-tools.nvim'
	
	-- LSP progress indicator
	use 'j-hui/fidget.nvim'

	-- movements for commenting code (using gc<movement>)
	use 'tpope/vim-commentary'
	-- Git extensions
	use 'tpope/vim-fugitive'
	-- netrw enhancements
	use 'tpope/vim-vinegar'
	use 'lewis6991/gitsigns.nvim'
	

	-- fzf extensions
	use { 'junegunn/fzf.vim', run = function() vim.fn["fzf#install"](0) end }

	-- Nice status bar
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- colorscheme
	use 'sainnhe/sonokai'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'nvim-tree/nvim-web-devicons'
	use 'folke/trouble.nvim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
end)

-- Automatically update packer when plugins change

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
	use { 
		'simrat39/rust-tools.nvim', 
		requires = { {'nvim-lua/plenary.nvim'}, {'mfussenegger/nvim-dap'} }
	}
	
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	
	-- LSP progress indicator
	use {
		'j-hui/fidget.nvim',
		tag = 'legacy',
		config = {
			require('fidget').setup{
				-- options
			}
		}
	}

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
	use 'folke/tokyonight.nvim'
	use { 'catppuccin/nvim', as = 'catppuccin' }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'nvim-tree/nvim-web-devicons'
	use 'folke/trouble.nvim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({
		"luukvbaal/statuscol.nvim",
		config = function() require("statuscol").setup() end
	})
	use({
		'saecki/crates.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
	})

	use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


call plug#begin()
" Server configurations for builtin nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Auto-completion plugins
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" rust-analyzer add-ons
Plug 'simrat39/rust-tools.nvim'

" movements for commenting code (using gc<movement>)
Plug 'tpope/vim-commentary'
" Git extensions
Plug 'tpope/vim-fugitive'
" netrw enhancements
Plug 'tpope/vim-vinegar'

" handles installing fzf for the terminal
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" fzf extensions
Plug 'junegunn/fzf.vim'
" Nice status bar
Plug 'itchyny/lightline.vim'
" Enhanced syntax higlighting for various languages (not complete due to
" limitations the syntax recognition in vim/nvim
Plug 'sheerun/vim-polyglot'

" Adds builtin support for generating doxygen comments based on code under the
" cursor
Plug 'vim-scripts/DoxygenToolkit.vim' 

" colorscheme
Plug 'sainnhe/sonokai'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'hallison/vim-rdoc'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
call plug#end()
colorscheme sonokai

" Allows folding (z<movement>) to recognize syntax folding rules, i.e. folding
" on braces for C/C++
set foldmethod=syntax
" Set text to be unfolded by default
set nofoldenable
" enable syntax highlighting
syntax enable
" display line numbers
set number 

" if hidden is not set, TextEdit might fail.
set hidden

" set all tabs and shifts (<</>>) to be 4 columns wide
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Better display for messages
set cmdheight=2

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" don't give |ins-completion-menu| messages.
set shortmess+=c 

" display signs in the line number column
set signcolumn=number 

" Use our horizontal real estate to show the 3-way diff
set diffopt+=vertical

" Enable the CCLS language server. This overwrites the default diagnostic
" behavior to use the diagnostic-nvim plugin
lua << EOF
require("trouble").setup{}
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'solargraph', 'eslint' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

let g:lightline = {
			\ 'active': {
			\	'left': [ [ 'mode', 'paste'],
			\			[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\	'gitbranch': 'FugitiveHead'
			\ },
			\ }

" Remapping of <Esc> to allow fingrers to never leave home keys, and allow
" terminal mode to support vi keybindings in the shell
inoremap <silent>jk <Esc>
tnoremap <silent>jk <C-\><C-n>

" Easy switching between windows
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remove highlights caused by searching
nnoremap <C-x> :nohl<cr>

" mapping for fzf
nnoremap <C-g> :Rg<Cr>
nnoremap <C-f> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>

" Shortcuts for code reformatting
nnoremap <silent> <F4> :py3f /home/trollham/.local/share/clang/clang-format.py<cr>
vnoremap <silent> <F4> :py3f /home/trollham/.local/share/clang/clang-format.py<cr>
inoremap <silent> <F4>:py3f /home/trollham/.local/share/clang/clang-format.py<cr>

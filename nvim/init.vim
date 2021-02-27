call plug#begin('~/.vim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Nice GUI tings
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Suuuuurround
Plug 'tpope/vim-surround'

" Comment things with gc
Plug 'tpope/vim-commentary'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" I've got no roots
Plug 'airblade/vim-rooter'

" == Lang support ==
Plug 'mhinz/vim-mix-format'
Plug 'mhinz/vim-crates'
Plug 'cespare/vim-toml'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sbdchd/neoformat'

" colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'cormacrelf/vim-colors-github'

" cool icons
Plug 'kyazdani42/nvim-web-devicons'

" Project navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
call plug#end()

syntax on

set number
set cursorline
set background=dark
set clipboard=unnamed
set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

" Use <SPACE> as leader
let mapleader = "\<Space>"

" set background=dark
" let g:airline_theme = "github"
" colorscheme github

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_hard'

set backspace=indent,eol,start
" Fix colors for alacritty
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" File browser
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" coc-explorer
nmap <leader>e :CocCommand explorer<CR>

" Telescope
lua << EOF
require'telescope'.setup{}
require'nvim-web-devicons'.setup{}
EOF

" Ctrl-p find files
" nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-p> <cmd>lua require'telescope.builtin'.git_files()<cr>
" Ripgrep
" nnoremap <leader>rg <cmd>Telescope live_grep<cr>
nnoremap <leader>rg <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<cr>
nnoremap <leader>ts <cmd>lua require'telescope.builtin'.treesitter()<cr>
nnoremap <silent>gr <cmd>lua require'telescope.builtin'.lsp_references()<cr>
nnoremap <leader>ws <cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>

" Allow mouse usage
set mouse=a

" Quick edit/reload nvim config
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" Use <space><space> to toggle to the last buffer
nnoremap <leader><leader> <c-^>

" splits
set splitbelow
set splitright

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

" Elixir
let g:mix_format_on_save = 1

" Dart
autocmd FileType dart setlocal shiftwidth=2 tabstop=2 softtabstop=2

" JS crap
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Neoformat prettier

" Directory specific overrides
" Disable rustfmt firefox stuff since it isn't used there yet.
:autocmd BufRead,BufNewFile /Users/cbrewster/Development/firefox/mozilla-central/* let b:rustfmt_autosave = 0
" repl it web uses 2 space indent
:autocmd BufRead,BufNewFile /Users/cbrewster/Development/repl-it-web/* setlocal ts=2 sw=2 expandtab

" Tree sitter tings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" === LSP Tings ===
set signcolumn=yes
set shortmess+=c
set completeopt=menuone,noselect

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

autocmd BufWritePre *.go,*.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

lua << EOF
local on_attach = function(client, buffer)
end

local capabilities = {}

require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.flow.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.vimls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local saga = require 'lspsaga'
saga.init_lsp_saga{}
EOF

nnoremap <leader>a  <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent>K  <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
xnoremap <silent> <c-k> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
inoremap <silent> <c-k> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>

nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'valloric/YouCompleteMe'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on
syntax on

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent

" YouCompleteMe config
let g:ycm_rust_src_path = '~/Development/rust'
nnoremap <Leader>] :YcmCompleter GoTo<CR>

set backspace=indent,eol,start

" Line numbers
set number
set relativenumber

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set noeb vb t_vb=

" Colors
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
" set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
execute ":let g:airline_theme='base16'"

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1

" system clipboard
set clipboard=unnamed

" NERDTree binding
map <C-n> :NERDTreeToggle<CR>

" shortcut to save
nmap <leader>, :w<cr>

" Add nav controls to quickfix window for Ag
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Unmap GitGutter <leader>h*
let g:gitgutter_map_keys = 0

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Add lines without going into insert mode
nmap <C-O> O<Esc>
nmap <CR> o<Esc>

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

call vundle#end()
filetype plugin indent on
syntax on

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent

let g:ycm_rust_src_path = '/Users/connor/Development/rust'

set backspace=indent,eol,start

" Line numbers
set number
set relativenumber

set noeb vb t_vb=

" Colors
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
execute ":let g:airline_theme='".$THEME."'"
highlight Comment cterm=italic


" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1

" system clipboard
set clipboard=unnamed

" NERDTree binding
map <C-n> :NERDTreeToggle<CR>


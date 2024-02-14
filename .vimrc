let mapleader=" " 

"set linenumber
set relativenumber number
" set compatiblity to vim only
set nocompatible
" set line wrapping
set wrap
set noshowmatch
"cursor theme
set guicursor=a:ver20
"Encoding
set encoding=utf-8
set ignorecase
set shiftwidth=4
set mouse=a
syntax on
set autoindent
set expandtab
set tabstop=4
set clipboard+=unnamedplus
filetype plugin on
set ttyfast
set noswapfile
" Status bar
set laststatus=2
" Wildmode
set wildmode=longest,list,full
" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
map <leader>f :Goyo \| set linebreak<CR>
set splitbelow splitright
call plug#begin()
" Plugin Section
 "Plug 'vimwiki/vimwiki'
 Plug 'junegunn/goyo.vim'

 Plug 'tpope/vim-surround'
 "Plug 'morhetz/gruvbox'
 "Plug 'ryanoasis/vim-devicons'
 Plug 'lervag/vimtex'
 Plug 'tpope/vim-commentary'
 "Plug 'luochen1990/rainbow'
 Plug 'bullets-vim/bullets.vim'
 "Plug 'neoclide/coc'
 "Plug 'vim-airline/vim-airline'
 Plug 'jiangmiao/auto-pairs'
 Plug 'scrooloose/nerdtree'
call plug#end()


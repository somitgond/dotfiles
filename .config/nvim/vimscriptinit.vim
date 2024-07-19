"let mapleader=" " 
" Enable line numbering
set number

" Optimize for faster terminal
set ttyfast

" Enable true color support
set termguicolors

" Disable Vim compatibility for a more modern experience
set nocompatible

" Configure line wrapping and cursor
set wrap
set guicursor=a:ver20

" Encoding and case sensitivity
set encoding=utf-8
set ignorecase

" Indentation settings
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" Mouse support
set mouse=a

" Clipboard settings (no clipboard integration)
set clipboard=

" Performance optimizations
set noswapfile           " Disable swap files
set nobackup             " Disable backup files
set nowritebackup        " Disable write backup files
set lazyredraw           " Use faster redraw

" Wildmenu settings for command-line completion
set wildmode=longest,list

" some shortcuts 
"
" compile c++ file 
autocmd filetype cpp nnoremap <F9> :wall <bar> !g++ -std=c++14 % -o %:r -Wall -O2 && timeout 4s ./%:r<inputf.in>outputf.in <CR>

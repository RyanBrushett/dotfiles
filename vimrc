set wrap
set autoread
set nocompatible
set ts=2
set sw=2
set expandtab
set background=dark
syntax on
set ruler
set cmdheight=2
set hid
set showmatch 
set mat=2
set encoding=utf8
set nobackup
set nowb
set noswapfile
set ai
set si 
set tw=120
set cc=+1
set hlsearch
set incsearch

execute pathogen#infect()
filetype plugin indent on

nnoremap <silent>c :nohl<CR><C-l>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

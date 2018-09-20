set nowrap
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

nnoremap <silent>c :nohl<CR><C-l>

" Automatic toggling of relative and absolute line numbers

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

execute pathogen#infect()

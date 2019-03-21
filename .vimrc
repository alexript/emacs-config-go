language English_United States
set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set ruler
set ignorecase
set hlsearch
set incsearch
set autoindent
colorscheme desert
set guioptions-=T
set fileformats=unix,dos
set encoding=utf-8
set guifont=InconsolataCyr:h16
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
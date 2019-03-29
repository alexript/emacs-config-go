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

let g:license_author = "Alex 'Ript' Malyshev"
let g:license_email = 'alexript@gmail.com'

" Commenting blocks of code. Now you can type ,cc to comment a line and ,cu to uncomment a line (works both in normal and visual mode).
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType dosbatch          let b:comment_leader = 'rem '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Alt-right/left to navigate forward/backward in the tags stack
map <M-Left> <C-T>
map <M-Right> <C-]>

" https://github.com/inkarkat/vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoLoadMarks = 1
nmap <Leader>N <Plug>MarkAllClear

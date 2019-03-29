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

" colorscheme desert
" https://github.com/jonathanfilip/vim-lucius
colorscheme lucius
LuciusDark

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

" https://github.com/xolox/vim-easytags
:let g:easytags_always_enabled = 1
:let g:easytags_auto_highlight = 1

" https://github.com/inkarkat/vim-AutoAdapt
let g:AutoAdapt_FilePattern = '*.h,*.c,*.cpp,*.go,*.md'

" MiniBufExpl Colors https://github.com/fholgado/minibufexpl.vim
" hi MBENormal               guifg=#808080 guibg=fg
" hi MBEChanged              guifg=#CD5907 guibg=fg
" hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
" hi MBEVisibleChanged       guifg=#F1266F guibg=fg
" hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
" hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" https://github.com/itchyny/calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
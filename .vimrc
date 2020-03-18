if has('unix')
	language messages C
else
	language English_United States
endif
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

if has("gui_running")
" colorscheme desert
" https://github.com/jonathanfilip/vim-lucius
colorscheme lucius
LuciusDark
else
	colorscheme industry
endif

set guioptions-=T
set fileformats=unix,dos
set encoding=utf-8
set guifont=InconsolataCyr:h16
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  if has('unix')
    set lines=54 columns=200
  else
    set lines=999 columns=999
  endif
endif

if has("gui_running")
  if has("gui_gtk2")
      set guifont=InconsolataCyr\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
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
autocmd FileType conf,fstab,cmake       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType dosbatch          let b:comment_leader = 'rem '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Alt-right/left to navigate forward/backward in the tags stack
map <M-Left> <C-T>
map <M-Right> <C-]>

" vim-go
let g:go_version_warning = 0

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

" https://github.com/twitvim/twitvim
let twitvim_enable_python3 = 1
let twitvim_timestamp_format = '%Y-%m-%d %H:%M'
let twitvim_allow_multiline = 1

" https://github.com/vim-scripts/DoxygenToolkit.vim
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Alex 'Ript' Malyshev"
let g:DoxygenToolkit_licenseTag="The MIT License (MIT)" 

" OmniSharp
let g:OmniSharp_server_stdio = 1
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

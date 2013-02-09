set shell=/bin/bash

call pathogen#infect()

set nocompatible "Use Vim defaults

syntax enable


let g:syntastic_ocaml_camlp4r = 1

filetype on " enables filetype detection
filetype plugin on " enable filetype specific plugins
filetype indent on

set spell spelllang=en_us " enable spell-check
set dictionary="/usr/share/dict/words"

" Allow hidden buffer
set hidden 

" Command-line completion operates in an enhanced mode. On pressing
" 'wildchar' (usually <Tab>) to invoke completion, the possible matches are
" shown just above the command line, with the first match highlighted
" overwriting the status line if there is one.)
set wildmenu

set backspace=indent,eol,start  " backspace through everything in insert mode

" Config for polling apps
"set nobackup " Do not make a backup before overwriting a file
"set nowritebackup " Do not make a backup before overwriting a file
"set noswapfile " Don't create swapfiles


" Searching
"""""""""""

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" While typing a search command, show where the pattern, as it was typed so
" far, matches. The matched string is highlighted.
set incsearch

" While searching, the case of normal letters is ignored.
set ignorecase

" Ignore case when the patterns contains lowercase letters only.
set smartcase


"Graphical interface options
"""""""""""""""""""""""""""""

" Enable the use of the mouse. Only works for certain terminals.
" The mouse can be enabled for different modes:
"   n   Normal mode
"   v   Visual mode
"   i   Insert mode
"   c   Command-line mode
"   a   All four modes modes
set mouse=a

set background=dark "use colors which look good on a light background

colorscheme solarized
" let g:solarized_contrast="high"
if exists("&colorcolumn")
    "color of ruler @ 80 col, 2=green, 0=light gray
    set colorcolumn=81
    highlight ColorColumn ctermbg=2
endif

"automatically wrap around at the 80 character limit
" Maximum width of text that is being inserted. A longer line will be broken
" after white space to get this width. A zero value disables this. 'textwidth'
" is set to 0 when the paste option is set.
set textwidth=0

" When on, lines longer than the width of the window will wrap and displaying
" continues on the next line. When off, lines will not wrap and only part of
" long lines will be displayed. When the cursor is moved to a part that is not
" shown, the screen will scroll horizontally.
set nowrap

" Number of columns on the screen. Normally this is set by the terminal
" initialization and does not have to be set by hand.
"set columns=80

" Display unprintable characters with '^' and put $ after the line.
" set list

" Precede each line with its line number.
set number

" Show the line number relative to the line with the cursor in front of each
" line.
"set relativenumber

" Show the line and column number of the cursor position, separated by a
" comma.
set ruler

" Show partial commands in the last line of the screen
set showcmd

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5


" Indentation
"====================================

" Number of spaces that a <Tab> in the file counts for.
" > This affects how existing text displays.
set tabstop=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.
set softtabstop=4

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.
" When true, inserts 'softtabstop' spaces instead of a tab on <TAB>
set expandtab

" Number of spaces to use for each step of (auto)indent. Used for
" `cindent`, `>>`, `<<`, etc.
set shiftwidth=4

" The kind of folding used for the current window.
" - indent - Lines with equal indent form a fold.
set foldmethod=indent

" Changes how <TAB> is interpreted depending on where the cursor is.
" If true, pressing <TAB> inserts indentation according to 'shiftwidth'
" at the beginning of a line, whereas 'tabstop' and 'softtabstop' are
" used everywhere else.
set smarttab

" Copy indent from current line when starting a new line.
set autoindent

" Copy the structure of the existing lines indent when autoindenting a new
" line.
set copyindent

" Automatically indent when it makes sense
" Do smart autoindenting when starting a new line.
" Works for C-like programs, but can also be used for other languages.
" An indent is automatically insert:
" - After a line ending in '{'.
" - After a line starting with a keyword from 'cinwords'.
" - Before a line starting with '}'
set smartindent


"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" Abbreviations
"====================================

abbreviate w/ with


" Mappings
"====================================

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" inoremap <esc> <nop>

let mapleader = "-"
let maplocalleader = "\\"

inoremap <space><space> <esc>
inoremap <leader><space> <esc>

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

nnoremap H ^
nnoremap L $


" Misc
"====================================

function! DistractionFreeWriting()
    set wrap " make long lines wrap around to the next line
    set linebreak " break the lines on words rather than arbitrary characters
    set nolist " don't show list
    set noruler " don't show ruler
    " set nonumber " don't show line number
    set laststatus=0 " don't show status line
endfunction

augroup markdown 
    " turn-on distraction free writing mode for markdown files
    autocmd BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()
augroup END

augroup highlight
    " Use javascript syntax highlighting for json
    autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

augroup comments
    autocmd FileType haskell nnoremap <buffer> <localleader>c I//
    autocmd FileType javascript nnoremap <buffer> <localleader>c I--
    autocmd FileType python     nnoremap <buffer> <localleader>c I#
augroup END

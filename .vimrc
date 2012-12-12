set shell=/bin/bash
call pathogen#infect()

set nocompatible "Use Vim defaults
filetype on " enables filetype detection
filetype plugin on " enable filetype specific plugins
filetype indent on
set spell spelllang=en_us " enable spell-check

" Allow hidden buffer
set hidden 
set wildmenu "command-line completion
set backspace=indent,eol,start  " backspace through everything in insert mode


" Searching
"""""""""""


set hlsearch   "highlight searches
set incsearch  "highlight what you are searching for as you type
set ignorecase "searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter


"Graphical interface options
"""""""""""""""""""""""""""""

set foldmethod=indent
set mouse=a "allow scrolling in iTerm

syntax enable
set background=dark "use colors which look good on a light background
colorscheme solarized
if exists("&colorcolumn")
    " display a colored column in column 80
    autocmd InsertEnter * set colorcolumn=81
    autocmd InsertLeave * set colorcolumn=""
    "color of ruler @ 80 col, 2=green, 0=light gray
    highlight ColorColumn ctermbg=0
endif

"highlight any characters past 80
"match ErrorMsg '\%>80v.\+'

"automatically wrap around at the 80 character limit
set textwidth=80
" dont wrap (no need)
set nowrap

"set columns=80 "set the number of columns used on the screen

set list "print hidden characters
set number "display line number on left
"set rnu "display relative line number on left
set ruler "display cursor position
set showcmd "show partial commands in the last line of the screen

set scrolloff=5 "pad top and bottom of screeen by x lines


" Indentation
"""""""""""""


" For indentation without tabs, the principle is to set 'expandtab' and set
" 'shiftwidth' and 'softtabstop' to the same value, while leaving 'tabstop'
" at its default value ('tabstop' defines the width of the TAB character).

"a tab is 4 spaces
set softtabstop=4

" Affects '>>', '<<', '==', and automatic indentation.
set shiftwidth=4

" When true, inserts 'softtabstop' spaces instead of a tab on <TAB>
set expandtab

" Changes how <TAB> is interpreted depending on where the cursor is.
" If true, pressing <TAB> inserts indentation according to 'shiftwidth'
" at the beginning of a line, whereas 'tabstop' and 'softtabstop' are
" used everywhere else.
set smarttab

" Copy the indentation from the previous line when starting a new line
set autoindent

" When autoindenting, copy indent format of previous line
set copyindent

" Automatically indent when it makes sense
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
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


" Disable the arrow-keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Use jj to get back to command mode instead of Esc, which is out of the
" " way and on some keyboards hard to reach. Esc still works too.
inoremap jj <esc>

" turn-on distraction free writing mode for markdown files
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()

function! DistractionFreeWriting()
    set wrap " make long lines wrap around to the next line
    set linebreak " break the lines on words rather than arbitrary characters
    set nolist " don't show list
    set noruler " don't show ruler
    set nonumber " don't show line number
    set laststatus=0 " don't show status line
endfunction


" Use javascript syntax highlighting for json
autocmd BufNewFile,BufRead *.json set ft=javascript

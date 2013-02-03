set shell=/bin/bash
call pathogen#infect()


let g:syntastic_ocaml_camlp4r = 1

set nocompatible "Use Vim defaults
filetype on " enables filetype detection
filetype plugin on " enable filetype specific plugins
filetype indent on
set spell spelllang=en_us " enable spell-check

" Allow hidden buffer
set hidden 
set wildmenu "command-line completion
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

" The kind of folding used for the current window.
" - indent - Lines with equal indent form a fold.
set foldmethod=indent

" Enable the use of the mouse. Only works for certain terminals.
" The mouse can be enabled for different modes:
"   n   Normal mode
"   v   Visual mode
"   i   Insert mode
"   c   Command-line mode
"   a   All four modes modes
set mouse=a

syntax enable
set background=dark "use colors which look good on a light background
colorscheme solarized
" let g:solarized_contrast="high"
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
" set textwidth=80
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

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.
set softtabstop=4

" Affects '>>', '<<', '==', and automatic indentation.
set shiftwidth=4

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.
" When true, inserts 'softtabstop' spaces instead of a tab on <TAB>
set expandtab

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
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


" Abbreviations

abbreviate w/ with


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
    " set nonumber " don't show line number
    set laststatus=0 " don't show status line
endfunction


" Use javascript syntax highlighting for json
autocmd BufNewFile,BufRead *.json set ft=javascript

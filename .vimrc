call pathogen#infect()
call pathogen#helptags()

set nocompatible "Use Vim defaults
syntax enable
filetype on " enables filetype detection
filetype plugin on " enable filetype specific plugins
filetype indent on
:set spell spelllang=en_us " enable spell-check

set hidden "use .swp files
set wildmenu "command-line completion
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch   "highlight searches
set incsearch  "highlight what you are searching for as you type
set ignorecase "searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

"Graphical interface options
set background=dark "use colors which look good on a dark background
let g:solarized_termcolors=256
colorscheme solarized

"set columns=80 "set the number of columns used on the screen
set nowrap "don't wrap lines

set list "print hidden characters
set number "display line number on left
set ruler "display cursor position
set showcmd "show partial commands in the last line of the screen

set scrolloff=5 "pad top and bottom of screeen by x lines

"Use 2 spaces instead of tabs
set softtabstop=4 shiftwidth=4 "a tab is 4 spaces
set expandtab "uses spaces, not tabs
set smarttab

set autoindent
set copyindent "when autoindenting, use indent format of previous line


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

" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

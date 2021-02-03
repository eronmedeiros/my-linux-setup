set encoding=utf-8  " Encoding
set backspace=2     " Backspace deletes like most programs in insert mode
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set laststatus=2    " Always display the status line
set nojoinspaces    " Use one space, not two, after punctuation
set number          " Display line numbers

" Detects the file type and loads plugin and indent for that filetype
filetype plugin indent on

" Show hidden characters, tabs, trailing whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Indentation with 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

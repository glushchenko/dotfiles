call pathogen#infect()	"bundles by dir

" ====================== beahavior
filetype plugin on      "load modules by file types
filetype indent on	"indent by file types
set tabstop=4           " 1tab = 4space
set shiftwidth=4        " 1shift (>>) = 4space
set autoindent          "same indent as previous line
set expandtab           "spaces instead tabs
set hidden              "hidden buffer instead close

" ====================== visual
syntax on	        "syntax highlighter
set number              "line numbers
set nowrap              "no wrap long lines
set visualbell          "beep by flashing the screen
set ruler               "line status

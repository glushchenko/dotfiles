call pathogen#infect()	"bundles by dir

" ====================== beahavior
filetype plugin on      "load modules by file types
filetype indent on	    "indent by file types
set tabstop=4           " 1tab = 4space
set shiftwidth=4        " 1shift (>>) = 4space
set autoindent          "same indent as previous line
set expandtab           "spaces instead tabs
set hidden              "hidden buffer instead close

" ====================== visual
syntax on	            "syntax highlighter
set number              "line numbers
set nowrap              "no wrap long lines
set visualbell          "beep by flashing the screen
set ruler               "line status

" ====================== auto paste
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

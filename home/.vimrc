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

" ====================== spell (ctrl + F11) 
if version >= 700
    setlocal spell spelllang=
    setlocal nospell
    function ChangeSpellLang()
        if &spelllang =~ "en_us"
            setlocal spell spelllang=ru
            echo "spelllang: ru"
        elseif &spelllang =~ "ru"
            setlocal spell spelllang=
            setlocal nospell
            echo "spelllang: off"
        else
            setlocal spell spelllang=en_us
            echo "spelllang: en"
        endif
    endfunc

    " map spell on/off for English/Russian
    map <F11> <Esc>:call ChangeSpellLang()<CR>
endif

" ====================== markdown
let g:vim_markdown_folding_disabled=1

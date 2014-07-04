set nocompatible              " be iMproved
filetype off                  " required!

" ====================== vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'plasticboy/vim-markdown'

" ====================== beahavior
filetype plugin on      "load modules by file types
filetype indent on	    "indent by file types
set tabstop=4           " 1tab = 4space
set shiftwidth=4        " 1shift (>>) = 4space
set autoindent          "same indent as previous line
set expandtab           "spaces instead tabs
set hidden              "hidden buffer instead close
set clipboard=unnamed	" copy paste tmux
set noswapfile          " disable swp files

" ====================== visual
syntax on	            "syntax highlighter

set number              "line numbers
set nowrap              "no wrap long lines
set visualbell          "beep by flashing the screen
set ruler               "line status

" ====================== themes
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set background=dark
endif

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

" ====================== autocmd
if has("autocmd")
    autocmd BufNewFile,BufRead *.markdown set wrap
endif

" ====================== show “invisible” characters
set lcs=tab:▸\ ,trail:·
set list

" ====================== tmux arrows working properly
if &term =~ '^screen'
	" tmux will send xterm-style keys when xterm-keys is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

" ====================== ledger
let g:ledger_maxwidth = 80

" ====================== markdown
let g:vim_markdown_folding_disabled=1

" ====================== YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 1

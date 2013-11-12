" Maintainer: Arseny Zarechnev <cyanidesign@gmail.com>
" Version: 0.3.1
" Last Modified: Apr 3, 2013
" License: Public domain.
" Url: http://www.vim.org/scripts/script.php?script_id=4493
" Description: Bind pressing russian key in normal mode to toggle layout and
" repeat same key.

if exists('g:loaded_rusmode') || &cp || version < 700
	finish
endif
let g:loaded_rusmode = 1
let s:is_mac = substitute(system('uname'), "\n", "", "") ==? 'Darwin'

" Check if system is not MacOS
if !s:is_mac
    " Must have commands for get and set layout
    if !exists('g:rusmode_get_layout_command')
        finish
    endif

    if !exists('g:rusmode_set_layout_command')
        finish
    endif
endif

if s:is_mac
    let s:current_dir = expand("<sfile>:p:h")
    let g:rusmode_get_layout_command = s:current_dir . '/../changeInput'
    let g:rusmode_set_layout_command = g:rusmode_get_layout_command
endif

if !exists('g:rusmode_normal_layout')
    let g:rusmode_normal_layout = 'U.S.'
endif


if !exists('g:rusmode_autotoggle_insertleave')
    let g:rusmode_autotoggle_insertleave = 0
endif

function s:ChangeLayout(key)
    let l:current_layout = substitute(system(g:rusmode_get_layout_command), "\n", "", "")
    if l:current_layout ==? g:rusmode_normal_layout
        if a:key ==? '/'
            return '.'
        elseif a:key ==? '?'
            return ','
        else
            return a:key
        endif
    endif
    call system(g:rusmode_set_layout_command . ' ' . g:rusmode_normal_layout)
    return a:key
endfunction

if g:rusmode_autotoggle_insertleave
    autocmd InsertLeave * call s:ChangeLayout("\<ESC>")
endif

nmap <expr> <unique> ё <SID>ChangeLayout('§')
nmap <expr> <unique> й <SID>ChangeLayout('q')
nmap <expr> <unique> ц <SID>ChangeLayout('w')
nmap <expr> <unique> у <SID>ChangeLayout('e')
nmap <expr> <unique> к <SID>ChangeLayout('r')
nmap <expr> <unique> е <SID>ChangeLayout('t')
nmap <expr> <unique> н <SID>ChangeLayout('y')
nmap <expr> <unique> г <SID>ChangeLayout('u')
nmap <expr> <unique> ш <SID>ChangeLayout('i')
nmap <expr> <unique> щ <SID>ChangeLayout('o')
nmap <expr> <unique> з <SID>ChangeLayout('p')
nmap <expr> <unique> х <SID>ChangeLayout('[')
nmap <expr> <unique> ъ <SID>ChangeLayout(']')
nmap <expr> <unique> ф <SID>ChangeLayout('a')
nmap <expr> <unique> ы <SID>ChangeLayout('s')
nmap <expr> <unique> в <SID>ChangeLayout('d')
nmap <expr> <unique> а <SID>ChangeLayout('f')
nmap <expr> <unique> п <SID>ChangeLayout('g')
nmap <expr> <unique> р <SID>ChangeLayout('h')
nmap <expr> <unique> о <SID>ChangeLayout('j')
nmap <expr> <unique> л <SID>ChangeLayout('k')
nmap <expr> <unique> д <SID>ChangeLayout('l')
nmap <expr> <unique> ж <SID>ChangeLayout(';')
nmap <expr> <unique> э <SID>ChangeLayout("'")
nmap <expr> <unique> я <SID>ChangeLayout('z')
nmap <expr> <unique> ч <SID>ChangeLayout('x')
nmap <expr> <unique> с <SID>ChangeLayout('c')
nmap <expr> <unique> м <SID>ChangeLayout('v')
nmap <expr> <unique> и <SID>ChangeLayout('b')
nmap <expr> <unique> т <SID>ChangeLayout('n')
nmap <expr> <unique> ь <SID>ChangeLayout('m')
nmap <expr> <unique> б <SID>ChangeLayout(',')
nmap <expr> <unique> ю <SID>ChangeLayout('.')
nmap <expr> <unique> Ё <SID>ChangeLayout('±')
nmap <expr> <unique> Й <SID>ChangeLayout('Q')
nmap <expr> <unique> Ц <SID>ChangeLayout('W')
nmap <expr> <unique> У <SID>ChangeLayout('E')
nmap <expr> <unique> К <SID>ChangeLayout('R')
nmap <expr> <unique> Е <SID>ChangeLayout('T')
nmap <expr> <unique> Н <SID>ChangeLayout('Y')
nmap <expr> <unique> Г <SID>ChangeLayout('U')
nmap <expr> <unique> Ш <SID>ChangeLayout('I')
nmap <expr> <unique> Щ <SID>ChangeLayout('O')
nmap <expr> <unique> З <SID>ChangeLayout('P')
nmap <expr> <unique> Х <SID>ChangeLayout('{')
nmap <expr> <unique> Ъ <SID>ChangeLayout('}')
nmap <expr> <unique> Ф <SID>ChangeLayout('A')
nmap <expr> <unique> Ы <SID>ChangeLayout('S')
nmap <expr> <unique> В <SID>ChangeLayout('D')
nmap <expr> <unique> А <SID>ChangeLayout('F')
nmap <expr> <unique> П <SID>ChangeLayout('G')
nmap <expr> <unique> Р <SID>ChangeLayout('H')
nmap <expr> <unique> О <SID>ChangeLayout('J')
nmap <expr> <unique> Л <SID>ChangeLayout('K')
nmap <expr> <unique> Д <SID>ChangeLayout('L')
nmap <expr> <unique> Ж <SID>ChangeLayout(':')
nmap <expr> <unique> Э <SID>ChangeLayout('"')
nmap <expr> <unique> Я <SID>ChangeLayout('Z')
nmap <expr> <unique> Ч <SID>ChangeLayout('X')
nmap <expr> <unique> С <SID>ChangeLayout('C')
nmap <expr> <unique> М <SID>ChangeLayout('V')
nmap <expr> <unique> И <SID>ChangeLayout('B')
nmap <expr> <unique> Т <SID>ChangeLayout('N')
nmap <expr> <unique> Ь <SID>ChangeLayout('M')
nmap <expr> <unique> Б <SID>ChangeLayout('<')
nmap <expr> <unique> Ю <SID>ChangeLayout('>')
nmap <expr> <unique> . <SID>ChangeLayout('/')
nmap <expr> <unique> , <SID>ChangeLayout('?')

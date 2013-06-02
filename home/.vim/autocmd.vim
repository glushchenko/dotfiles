if has("autocmd")
    autocmd BufNewFile,BufRead *.markdown set wrap
else
    set autoindent
endif

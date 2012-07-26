
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au! BufRead,BufNewFile *.psp	setfiletype psp
    au! BufRead,BufNewFile *.proto	setfiletype proto
    au! BufRead,BufNewFile *.vol        setfiletype glusterfs
    au! BufRead            *.log	setfiletype log
augroup END


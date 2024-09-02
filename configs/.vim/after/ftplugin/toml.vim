map <buffer> <C-D> :s@^[[:space:]]*@&#@g<CR>:nohls<CR>
map <buffer> <C-U> :s@^\([[:space:]]*\)#@\1@g<CR>:nohls<CR>

" Clear the previous matches
for m in getmatches()
    if m['id'] < 0 || m['id'] > 2
        call matchdelete(m['id'])
    endif
endfor

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red
" Make trailing whitespace be flagged as bad.
let space_at_eol = matchadd("BadWhitespace", '\s\+$', -1)


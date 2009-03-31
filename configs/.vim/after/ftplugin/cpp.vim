
setlocal textwidth=80

" default makeprg
setlocal makeprg=fancymake
setlocal formatoptions=tcrql

map <buffer> <C-D> :s@^[[:space:]]*@&//@g<CR>:nohls<CR>
map <buffer> <C-U> :s@^\([[:space:]]*\)//@\1@g<CR>:nohls<CR>

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

highlight TooLongLineEnding ctermbg=red guibg=red ctermfg=black guifg=black
" Make characters in 81+ virtual column be highlighted as errors.
if &textwidth
    let too_long_line_ending = matchadd("TooLongLineEnding", '.\%>' . (&textwidth + 1) . 'v', -1)
endif



setlocal shiftwidth=4 softtabstop=4 expandtab textwidth=79
setlocal formatoptions=tcrql
let python_highlight_all = 1

map <buffer> <C-D> :s@^[[:space:]]*@&#@g<CR>:nohls<CR>
map <buffer> <C-U> :s@^\([[:space:]]*\)#@\1@g<CR>:nohls<CR>

let g:pylint_onwrite = 0
compiler pylint

" Clear the previous matches
for m in getmatches()
    if m['id'] < 0 || m['id'] > 2
        call matchdelete(m['id'])
    endif
endfor

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
let initial_tabs = matchadd("BadWhitespace", '^\t', -1)
" Make trailing whitespace be flagged as bad.
let space_at_eol = matchadd("BadWhitespace", '\s\+$', -1)

highlight TooLongLineEnding ctermbg=red guibg=red ctermfg=black guifg=black
" Make characters in 81+ virtual column be highlighted as errors.
if &textwidth
    let too_long_line_ending = matchadd("TooLongLineEnding", '.\%>' . (&textwidth + 1) . 'v', -1)
endif

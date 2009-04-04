
map <buffer> <C-D> :s@^[[:space:]]*@&%@g<CR>:nohls<CR>
map <buffer> <C-U> :s@^\([[:space:]]*\)%@\1@g<CR>:nohls<CR>
map <buffer> Y gwap

" default makeprg
setlocal makeprg=latex\ -interaction=nonstopmode\ --src-special\ '%'
setlocal errorformat=%E!\ LaTeX\ %trror:\ %m,
	\%E!\ %m,
	\%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
	\%+W%.%#\ at\ lines\ %l--%*\\d,
	\%WLaTeX\ %.%#Warning:\ %m,
	\%Cl.%l\ %m,
	\%+C\ \ %m.,
	\%+C%.%#-%.%#,
	\%+C%.%#[]%.%#,
	\%+C[]%.%#,
	\%+C%.%#%[{}\\]%.%#,
	\%+C<%.%#>%.%#,
	\%C\ \ %m,
	\%-GSee\ the\ LaTeX%m,
	\%-GType\ \ H\ <return>%m,
	\%-G\ ...%.%#,
	\%-G%.%#\ (C)\ %.%#,
	\%-G(see\ the\ transcript%.%#),
	\%-G\\s%#,
	\%+O(%f)%r,
	\%+P(%f%r,
	\%+P\ %\\=(%f%r,
	\%+P%*[^()](%f%r,
	\%+P[%\\d%[^()]%#(%f%r,
	\%+Q)%r,
	\%+Q%*[^()])%r,
	\%+Q[%\\d%*[^()])%r

" Alt-2: compile; leaves INSERT mode
map <buffer> <m-2> gt:make `dirname %`/`basename % .tex`.dvi<CR><CR>gT
"map <m-2> :make<CR><CR>
imap <buffer> <m-2> <ESC><m-2>a

" this makes sens if suitable Makefile was provided
" and makeprg is reset to "make"
map <buffer> <m-6> gt:make `dirname %`/`basename % .tex`.pdf<CR><CR>gT
imap <buffer> <m-6> <ESC><m-6>a

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
    let too_long_line_ending = matchadd("TooLongLineEnding", '.\%>' . (&textwidth + 2) . 'v', -1)
endif

" This is a color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be
" and introduces small changes

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

hi Comment	term=bold		ctermfg=blue		guifg=#80a0ff


let colors_name = "default"

" vim: sw=2


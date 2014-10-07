" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif


let &showbreak = "        ⤷  "

syn match fatal ".* FATAL .*"
syn match fatal "^FATAL: .*"
syn match error ".* ERROR .*"
syn match error "^ERROR: .*"
syn match warn ".* WARN .*"
syn match warn "^WARN: .*"
syn match info ".* INFO .*"
syn match info "^INFO: .*"
syn match debug ".* DEBUG .*"
syn match debug "^DEBUG: .*"

syn match error "^java.*Exception.*"
syn match error "^java.*Error.*"
syn match error "^\tat .*"

" Highlight colors for log levels.
hi fatal ctermfg=Red guifg=Red ctermbg=Black
hi error ctermfg=Red guifg=Red ctermbg=Black guibg=White
hi warn ctermfg=Yellow guifg=Brown ctermbg=Black
hi info ctermfg=Green guifg=DarkGreen ctermbg=Black
hi debug ctermfg=Gray guifg=Black ctermbg=Black

let b:current_syntax = "log"

" vim: ts=2 sw=2

" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif


let &showbreak = "        ⤷  "

syn match fatal "^\(\(DEBUG\|INFO\|WARN\|ERROR\|FATAL\)\@!.\)*\<FATAL\>.*"
syn match error "^\(\(DEBUG\|INFO\|WARN\|ERROR\|FATAL\)\@!.\)*\<ERROR\>.*"
syn match warn "^\(\(DEBUG\|INFO\|WARN\|ERROR\|FATAL\)\@!.\)*\<WARN\>.*"
syn match info "^\(\(DEBUG\|INFO\|WARN\|ERROR\|FATAL\)\@!.\)*\<INFO\>.*"
syn match debug "^\(\(DEBUG\|INFO\|WARN\|ERROR\|FATAL\)\@!.\)*\<DEBUG\>.*"

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

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Aug 12
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


"
"
" HERE starts the section with my owne settings
" 
"

command -nargs=1 Find edit `find -name <args> \| grep -vE '~$' \| head -n 1`

"color evening

" UI
color cs
if has("gui_running")
    set guifont=Courier\ New
endif

set spelllang=en,pl

set nowrap
"set winwidth=80
"set winheight=25

" when wrap ... motions
map <Up> gk
map <Down> gj
set whichwrap=<,>,[,],b,s

" save / close 
map <F2> :w<CR>
imap <F2> <ESC><F2>a
map <F10> :q<CR>
imap <F10> <ESC><F10>a

" default comment/uncomment
map <C-D> :s@^[[:space:]]*@&#@<CR>:nohls<CR>
map <C-U> :s@^\([[:space:]]*\)#@\1@<CR>:nohls<CR>


set fileencodings=utf-8,latin2
"set encoding=utf-8

set tabstop=8 " every tab is 8-spaces long
set textwidth=79

" indentation is always 4-spaces long and tabs are used
set shiftwidth=4 softtabstop=4 expandtab

" gT C++ environment
"set shiftwidth=8 softtabstop=8 noexpandtab

" SMK C++ environment
" indentation is always 4-spaces long and tabs are used


if &t_Co > 2 || has("gui_running")
  " folding
  set foldcolumn=0
  set foldlevel=10000
  set foldmethod=manual
  highlight Folded ctermbg=black ctermfg=blue
  highlight FoldColumn ctermbg=black ctermfg=darkgrey
endif


" searching
set ignorecase smartcase
set wildmenu " show suggestions when completing files

" svn blame command
"vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" make F5 highlight current word
nnoremap <silent> <F5> :set invhls<CR>:exec "let @/='\\<".expand("<cword>")."\\>'"<CR>

" code outline
nnoremap <silent> <F3> :TlistOpen<CR>
let Tlist_Close_On_Select = 1


" support for vim-trac plugin
" (http://www.vim.org/scripts/script.php?script_id=2147)
let g:tracServerList = {}
if filereadable(glob('~/.vimtrac'))
    source ~/.vimtrac
endif

" vim:softtabstop=2

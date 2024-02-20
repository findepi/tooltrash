#!bash

# brew
test -d "/opt/homebrew/sbin" && PATH="/opt/homebrew/sbin:$PATH"
test -d "/opt/homebrew/bin" && PATH="/opt/homebrew/bin:$PATH"

export PATH=~/bin:~/bin/tools:"$PATH"

export EDITOR=vim

#!bash

# brew
test -d "/opt/homebrew/sbin" && PATH="/opt/homebrew/sbin:$PATH"
test -d "/opt/homebrew/bin" && PATH="/opt/homebrew/bin:$PATH"

test -d ~/bin/tools && PATH=~/bin/tools:"$PATH"
test -d ~/bin && PATH=~/bin:"$PATH"
test -d ~/go/bin && PATH=~/go/bin:"$PATH"
test -d ~/.local/bin && PATH=~/.local/bin:"$PATH"

export EDITOR=vim

# Default on Mac is not generous enough
if [ $(ulimit -n) -lt 80012 ]; then
    ulimit -n 80012
fi

# Default on Mac is not generous enough
export RUST_MIN_STACK=$[16 * 1024 * 1024]

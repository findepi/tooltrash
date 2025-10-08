#!bash

# brew
test -d "/opt/homebrew/sbin" && PATH="/opt/homebrew/sbin:$PATH"
test -d "/opt/homebrew/bin" && PATH="/opt/homebrew/bin:$PATH"

export PATH=~/bin:~/bin/tools:"$PATH"

export EDITOR=vim

# Default on Mac is not generous enough
if [ $(ulimit -n) -lt 80012 ]; then
    ulimit -n 80012
fi

# Default on Mac is not generous enough
export RUST_MIN_STACK=$[16 * 1024 * 1024]

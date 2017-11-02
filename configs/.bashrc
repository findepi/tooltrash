#!bash

#if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
#  for f in $(brew --prefix)/etc/bash_completion.d/*; do
#    . "$f"
#  done
#fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.iterm2_shell_integration.bash

HISTCONTROL=ignorespace:ignoredups
HISTSIZE=1000
HISTFILESIZE=10000

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_DESCRIBE_STYLE=branch
#PS1='\u@\h \w$(__git_ps1)\$ '
#PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(__git_ps1)\$ '
PS1='\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(__git_ps1 '\'' \[\033[36m\]%s\[\033[m\]'\'')\$ '


#!bash

if which brew >/dev/null; then
    # bash-completion v1
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      source $(brew --prefix)/etc/bash_completion
    fi

    # bash-completion v2
    [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && source "$(brew --prefix)/etc/profile.d/bash_completion.sh"

    # MacOS `stat -f '%Su' <path>` or GNU `stat -c '%U' <path>` gives the owner
    if test "$(/usr/bin/stat -f '%Su' "$(brew --prefix)/bin")" != "$(whoami)"; then
        # TODO don't invoke sudo for read-only stuff like `brew --prefix`
        alias brew="sudo -Hu $(/usr/bin/stat -f '%Su' "$(brew --prefix)/bin") brew"
    fi
fi

test -f ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash

alias grep='grep --color=auto'
alias pwgen='pwgen --ambiguous --capitalize --secure --symbols -r '\\\'\''`*&@|"<>!\:[]=(){}#%^,$;?'\'' 20'

HISTCONTROL=ignorespace:ignoredups
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_DESCRIBE_STYLE=branch
#PS1='\u@\h \w$(__git_ps1)\$ '
#PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(__git_ps1)\$ '
PS1='\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(__git_ps1 '\'' \[\033[36m\]%s\[\033[m\]'\'')\$ '


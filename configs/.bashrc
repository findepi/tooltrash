#!bash

if bashrc_brew_prefix="$(brew --prefix 2>/dev/null)"; then
    # bash-completion v1
    if [ -f "${bashrc_brew_prefix}/etc/bash_completion" ]; then
      source "${bashrc_brew_prefix}/etc/bash_completion"
    fi

    # bash-completion v2
    [[ -r "${bashrc_brew_prefix}/etc/profile.d/bash_completion.sh" ]] && source "${bashrc_brew_prefix}/etc/profile.d/bash_completion.sh"

    # MacOS `stat -f '%Su' <path>` or GNU `stat -c '%U' <path>` gives the owner
    if test "$(/usr/bin/stat -f '%Su' "${bashrc_brew_prefix}/bin")" != "$(whoami)"; then
        # TODO don't invoke sudo for read-only stuff like `brew --prefix`
        alias brew="sudo -Hu $(/usr/bin/stat -f '%Su' "${bashrc_brew_prefix}/bin") brew"
    fi

    # brew installed nvm (npm version manager)
    test -d NVM_DIR="$HOME/.nvm" && export NVM_DIR="$HOME/.nvm"
    [ -s "${bashrc_brew_prefix}/opt/nvm/nvm.sh" ] && source "${bashrc_brew_prefix}/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "${bashrc_brew_prefix}/opt/nvm/etc/bash_completion.d/nvm" ] && source "${bashrc_brew_prefix}/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    # libpq
    test -d "${bashrc_brew_prefix}/opt/libpq/bin" && export PATH="${bashrc_brew_prefix}/opt/libpq/bin:$PATH"
    test -d "${bashrc_brew_prefix}/opt/libpq/lib" && export LDFLAGS="-L${bashrc_brew_prefix}/opt/libpq/lib"
    test -d "${bashrc_brew_prefix}/opt/libpq/include" && export CPPFLAGS="-I${bashrc_brew_prefix}/opt/libpq/include"
fi
unset bashrc_brew_prefix

[ -f ~/.iterm2_shell_integration.bash ] && source ~/.iterm2_shell_integration.bash

which fzf >/dev/null && eval "$(fzf --bash)"

[ -f ~/.cargo/env ] && source ~/.cargo/env

if [ -d ~/.jenv ] && which jenv >/dev/null; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

[ -d ~/Library/Application\ Support/JetBrains/Toolbox/scripts ] && PATH="$PATH":~/Library/Application\ Support/JetBrains/Toolbox/scripts

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

[ -f ~/.bashrc.local ] && source ~/.bashrc.local

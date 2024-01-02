#!bash

. ~/.profile

if brew_prefix_tmp="$(brew --prefix 2>/dev/null)"; then
   for d in coreutils findutils gnu-sed gnu-tar gawk grep; do
       test -d "${brew_prefix_tmp}/opt/${d}/libexec/gnubin" && export PATH="${brew_prefix_tmp}/opt/${d}/libexec/gnubin:$PATH"
       test -d "${brew_prefix_tmp}/opt/${d}/libexec/gnuman" && export MANPATH="${brew_prefix_tmp}/opt/${d}/libexec/gnuman:${MANPATH}"
   done
fi
unset brew_prefix_tmp

. ~/.bashrc

#!bash

. ~/.profile

if brew_prefix_tmp="$(brew --prefix 2>/dev/null)"; then
    if test "${INTELLIJ_ENVIRONMENT_READER:-}" = "true"; then
        # INTELLIJ_ENVIRONMENT_READER indicates running under IntelliJ Toolbox
        # Abstrain from putting more stuff on PATH for IntelliJ. Things like GNU `stat`
        # may break Hadoop libraries.
        # TODO we don't want to break Hadoop libraries on command line either.
        true
    else
        for d in coreutils findutils gnu-sed gnu-tar gawk grep; do
            test -d "${brew_prefix_tmp}/opt/${d}/libexec/gnubin" && export PATH="${brew_prefix_tmp}/opt/${d}/libexec/gnubin:$PATH"
            test -d "${brew_prefix_tmp}/opt/${d}/libexec/gnuman" && export MANPATH="${brew_prefix_tmp}/opt/${d}/libexec/gnuman:${MANPATH}"
        done
    fi
fi
unset brew_prefix_tmp

. ~/.bashrc

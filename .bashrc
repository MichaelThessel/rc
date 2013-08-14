# Dircolors for ls
[ "$TERM" != "dumb" ] && eval "`dircolors -b`" && alias ls='ls --color=auto'

# Aliases
alias phpgrep='grep --include="*.php"'

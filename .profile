export TERM='xterm-256color'
export PATH=$PATH:~/bin:~/bin/node/bin/:~/go/bin:/data/src/go/bin
export GOPATH=/data/src/go
export VISUAL="vim"

alias vi="nvim"
alias vim="nvim"
alias open="xdg-open"

alias m2="cd /data/src/m2"
alias m2s="cd /data/src/m2/src"
alias doc="cd $HOME/doc"

[ -e ~/.rc/.dircolors ] && eval $(dircolors -b ~/.rc/.dircolors) ||
    eval $(dircolors -b)

vimdir() {
    vim $(find "$1" -type f)
}

# Capslock acts as escape
setxkbmap -option caps:escape
xset r on

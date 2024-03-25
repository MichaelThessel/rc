export TERM='xterm-256color'
export PATH=$PATH:~/bin:~/bin/node/bin/:~/go/bin:/data/src/go/bin
export GOPATH=/data/src/go
export VISUAL="vim"

alias vi="nvim"
alias vim="nvim"
alias open="xdg-open"

vimdir() {
    vim $(find "$1" -type f)
}

# Capslock acts as escape
setxkbmap -option caps:escape
xset r on

export TERM='xterm-256color'
export PATH=$PATH:~/bin:~/bin/node/bin/:~/go/bin:/data/src/go/bin
export GOPATH=/data/src/go
export VISUAL="vim"

alias vi="nvim"
alias vim="nvim"
alias open="xdg-open"

alias aw="cd $GOPATH/src/github.com/MichaelThessel/amweb"
alias as="cd $GOPATH/src/github.com/MichaelThessel/amserver"
alias al="cd $GOPATH/src/github.com/MichaelThessel/amlib"
alias alg="cd $GOPATH/src/github.com/MichaelThessel/amlanding"
alias ab="cd $GOPATH/src/github.com/MichaelThessel/ambeacon"
alias ac="cd /data/src/ac"
alias m2="cd /data/src/m2"
alias doc="cd $HOME/doc"

alias ioglybeaconstart="aws ec2 start-instances --instance-ids i-05cfd77ef84284813"
alias ioglybeaconstop="aws ec2 stop-instances --instance-ids i-05cfd77ef84284813"
alias ioglybeaconstatus="aws ec2 describe-instance-status --instance-ids i-05cfd77ef84284813"

[ -e ~/.rc/.dircolors ] && eval $(dircolors -b ~/.rc/.dircolors) ||
    eval $(dircolors -b)

vimdir() {
    vim $(find "$1" -type f)
}

# Capslock acts as escape
setxkbmap -option caps:escape

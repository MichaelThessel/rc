export TERM='xterm-256color'
export PATH=$PATH:~/bin:~/bin/node/bin/:~/go/bin:/data/src/go/bin
export GOPATH=/data/src/go
export VISUAL="vim"

alias vi="vim"
alias open="xdg-open"

alias aw="cd $GOPATH/src/github.com/MichaelThessel/amweb"
alias as="cd $GOPATH/src/github.com/MichaelThessel/amserver"
alias al="cd $GOPATH/src/github.com/MichaelThessel/amlib"
alias alg="cd $GOPATH/src/github.com/MichaelThessel/amlanding"
alias ab="cd $GOPATH/src/github.com/MichaelThessel/ambeacon"
alias ac="cd /data/src/ac"
alias m2="cd /data/src/m2"

# Fix for Tilix split path issue https://goo.gl/BVxY8h
if [[ $TILIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi

[ -e ~/.rc/.dircolors ] && eval $(dircolors -b ~/.rc/.dircolors) ||
    eval $(dircolors -b)

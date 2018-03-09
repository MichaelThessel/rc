export TERM='xterm-256color'
export PATH=$PATH:~/bin:~/bin/node/bin/:~/go/bin:/data/src/go/bin
export GOPATH=/data/src/go
export VISUAL="vim"

alias vi="vim"
alias open="xdg-open"

# Map ^C to ^B; uniformly use ^C for copy and paste
stty intr ^B

# Fix for Tilix split path issue https://goo.gl/BVxY8h
if [[ $TILIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi

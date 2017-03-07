export TERM='xterm-256color'
export PATH=$PATH:~/bin:~/bin/node/bin/:~/go/bin:/data/src/go/bin
export GOPATH=/data/src/go
export VISUAL="vim"

# Map ^C to ^B; uniformly use ^C for copy and paste
stty intr ^B

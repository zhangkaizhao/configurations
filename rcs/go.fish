#set -g -x GOOS linux
#set -g -x GOARCH amd64

# GOROOT
#set -g -x GOROOT $HOME/go
#set -g -x GOBIN $GOROOT/bin
#set -g -x PATH $GOROOT/bin $PATH

# GOPATH
#set -g -x GOPATH $HOME/goext
set -g -x GOPATH /opt/moredata/goext
set -g -x PATH $GOPATH/bin $PATH

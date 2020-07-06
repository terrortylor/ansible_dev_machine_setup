case `uname` in
  Darwin)
    # commands for OS X go here
    export GOPATH=$HOME/workspace/oxy-go
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:$GOROOT/bin
  ;;
  Linux)
    # commands for Linux go here
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/workspace/oxy-go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  ;;
esac

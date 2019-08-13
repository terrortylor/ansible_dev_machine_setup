case `uname` in
  Darwin)
    # commands for OS X go here
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/workspace/oxy-go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  ;;
  Linux)
    # commands for Linux go here
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/workspace/oxy-go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  ;;
esac

case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    # commands for Linux go here
    export PATH=~/.npm-global/bin:$PATH
  ;;
esac

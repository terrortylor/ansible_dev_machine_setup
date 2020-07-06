case `uname` in
  Darwin)
    # commands for OS X go here
    eval "$(rbenv init -)"
  ;;
  Linux)
    # commands for Linux go here
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  ;;
esac

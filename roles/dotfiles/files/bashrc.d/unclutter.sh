case `uname` in
  Darwin)
    # commands for OS X go here
    ;;
  Linux)
    # Unclutter may not be installed,
    # depends on having i3 setup
    if hash gdate 2>/dev/null; then
      unclutter -idle 1 &
    fi
    ;;
esac

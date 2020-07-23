if hash teamocil 2>/dev/null; then
  # Add completion
  complete -W "$(teamocil --list)" teamocil
fi

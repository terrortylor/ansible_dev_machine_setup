if hash kubectl 2>/dev/null; then
  # Set up completion for kubectl
  source <(kubectl completion bash)

  alias kc="kubectl"

  # Use fzf to change kubectl context
  function kc-set-context() {
    context="$(kubectl config get-contexts | awk 'NR>1 {if ($1 ~ /\*/) {print $1 " " $2} else {print "  "$2} }' | fzf)"
    if [[ -n ${context} ]]; then
      context=${context//\*}
      kubectl config use-context ${context}
    fi
  }
fi

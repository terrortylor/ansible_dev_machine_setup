if hash kubectl 2>/dev/null; then
  # Set up completion for kubectl
  source <(kubectl completion bash)

  alias kc="kubectl"

  alias kgc="kubectl config get-contexts"

  alias kminikube="kubectl config use-context minikube"
fi

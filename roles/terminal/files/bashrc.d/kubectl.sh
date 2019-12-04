# Set up completion for kubectl
source <(kubectl completion bash)

alias kc="kubectl"

alias kgc="kubectl config get-contexts"

alias kminikube="kubectl config use-context minikube"

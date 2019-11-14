# docker-compose aliases
alias dcu="docker-compose up -d"
alias dcul="docker-compose up && docker-compose logs -f"
alias dcd="docker-compose down"

# docker aliases/functions
dsa() {
  echo 'Stopping all containers'
  docker stop $(docker ps -a -q)
}

dra() {
  echo 'Removing all containers'
  docker rm $(docker ps -a -q)
}

dra() {
  echo 'Removing all images'
  docker rmi -f $(docker images -q)
}
alias dsp="echo 'Docker system prune'; yes | docker system prune"
alias dpsa="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'"
alias dia="echo 'List all images'; docker images -a"

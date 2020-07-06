alias tmuxwork="tmux at -t work"

tmux_open_session() {
  if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters, expected 1 got $#"
    echo -e "Usage:\n${FUNCNAME[0]} <SESSION>"
    return 1
  fi

  if [[ $(tmux ls) == *"${1}:"* ]]; then
    tmux attach -t ${1}
  else
    tmux new-session -s ${1}
  fi
}

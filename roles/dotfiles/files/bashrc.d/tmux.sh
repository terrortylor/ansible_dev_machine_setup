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

tmux_set_window_name() {
  if [ -z $TMUX ]; then
    echo "Tmux not running... skipping"
  else
    git_root=$(git rev-parse --show-toplevel)
    if [ $? -eq 0 ]; then
      # Check in in work related workspace
      if [[ $git_root == *"${HOME}/workspace/"* ]]; then
        # If work related then grab last to directories
        name=$(echo "${git_root}" | rev | cut -d/ -f 1,2 | rev)
      else
        # just get current directory name
        name=${git_root##*/}
      fi
      tmux rename-window ${name}
    else
      echo "Not in git repo, set name as required..."
    fi
  fi
}

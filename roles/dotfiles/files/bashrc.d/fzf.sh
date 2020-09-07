# Open file(s) with fzf in vim
fvim() {
  local files

  files="$(fzf -m --preview 'cat {}')"

  if [[ -n $files ]]; then
     nvim -- $files
  fi
}

# fzf into directory under current
# Taken from: https://github.com/junegunn/fzf/wiki/examples#changing-directory
# I am too lazy to cd **<TAB>
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"

  tmux_set_window_name
}

# Same as above but moves to home directory first
ffcd() {
  cd ~
  fcd
}

fcat() {
  local file

  file="$(fzf --preview 'cat {}')"

  if [[ -n $file ]]; then
     cat $file
  fi
}

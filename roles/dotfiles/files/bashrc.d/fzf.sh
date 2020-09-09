# Open file(s) with fzf in vim
fvim() {
  local files

  files="$(fzf -m --preview 'cat {}')"

  if [[ -n $files ]]; then
     nvim -- $files
  fi
}

# fzf find a file and print name, called from bash keybinding
f_insert_file_name() {
  local file

  file="$(fzf --preview 'cat {}')"

  printf $file
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

# fzf find a directry and print, called from bash keybinding
f_insert_directory_name() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&

  printf $dir
}

# TODO single fcat/fbat function
fcat() {
  local file

  file="$(fzf --preview 'cat {}')"

  if [[ -n $file ]]; then
     cat $file
  fi
}

fbat() {
  local file

  file="$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')"

  if [[ -n $file ]]; then
     bat $file
  fi
}

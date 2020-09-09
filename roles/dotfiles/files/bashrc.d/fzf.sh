# Open file(s) with fzf in vim
fvim() {
  local files

  # TODO this is repeated, tidy up
  if type bat > /dev/null; then
    files="$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')"
  else
    files="$(fzf --preview 'cat {}')"
  fi

  if [[ -n $files ]]; then
     nvim -- $files
  fi
}

# fzf find a file and print name, called from bash keybinding
f_insert_file_name() {
  local file

  if type bat > /dev/null; then
    file="$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')"
  else
    file="$(fzf --preview 'cat {}')"
  fi

  if [[ -n $file ]]; then
    printf $file
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

# fzf find a directry and print, called from bash keybinding
f_insert_directory_name() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&

  if [[ -n $dir ]]; then
    printf $dir
  fi
}

fcat() {
  local file

  if type bat > /dev/null; then
    file="$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')"
  else
    file="$(fzf --preview 'cat {}')"
  fi

  if [[ -n $file ]]; then
    if type bat > /dev/null; then
      bat $file
    else
      cat $file
    fi
  fi
}

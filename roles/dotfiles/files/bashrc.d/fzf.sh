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

rgfzfpreview() {
  $1 >> /tmp/preview
  bat --style=numbers --color=always --line-range :500 $1
}

# Wrapper for ripgrep and fzf, using bat as preview
# To handle the ripgrep line, an external script RgFzfPreview is called, this
# must be on the path
# This is adapted from the fzf man docs
rgfzf() {
  path=${1}
  query=${2}
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$query' ${path}" \
    fzf --bind "change:reload:$RG_PREFIX {q} ${path} || true" \
    --ansi --phony --query "$query" \
    --layout=reverse \
    --preview-window=bottom \
    --preview 'RgFzfPreview {}'
}

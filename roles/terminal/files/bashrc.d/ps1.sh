BLUE="\[\033[01;34m\]"
YELLOW="\[\033[33m\]"
GREEN="\[\033[32m\]"
WHITE="\[\033[00m\]"
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
# export PS1="\[\033[01;34m\]\w \$(parse_git_branch)\[\033[00m\]\[\033[01;32m\]> \[\033[00m\]"
export PS1="${BLUE}\w ${YELLOW}\$(parse_git_branch)${GREEN}> ${WHITE}"

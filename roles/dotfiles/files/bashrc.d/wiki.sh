_NOTES_DIR=~/personnal-workspace/notes

tasks() {
  cd ${_NOTES_DIR}
  vim work/tasks.md
}

daybook() {
  cd ${_NOTES_DIR}
  vim -O work/daybook.md work/tasks.md
}

wiki() {
  cd ${_NOTES_DIR}
  vim -O work/index.md
}

# Returns filename
# If no arguments then just dated name
# if arguments then joins using - and returns date prefixed name
_getNoteName() {
  if [ "$#" -gt 0 ]; then
    args="${*}"
    label="-${args// /-}"
  fi
  # get date
  date=$(date +"%Y-%m-%d")
  # date=$(date +"%Y-%m-%d-%I-%M-%S")
  name="${date}${label}.md"
  echo "${name}"
}

_openNote() {
  if [ "$#" -eq 1 ]; then
    vim ${1}
  else
    vim ${1} -c "execute \"silent normal! i${2}\<C-R>=UltiSnips#ExpandSnippet()\<CR>\""
  fi
}

# creates note with date, if args given then creates
# a file with date prefix and args - seperated
newtechnote() {
  cd ${_NOTES_DIR}/tech
  name=$(_getNoteName $*)
  _openNote ${name} "quicknote"
}

# Creates a new note, if not in notes then moves to it
# if in notes dir, or subdir then creates not at given location
newnote() {
  if [[ "$(pwd)" != *"${_NOTES_DIR}"* ]]; then
      cd ${_NOTES_DIR}
  fi
  name=$(_getNoteName $*)
  _openNote ${name} "quicknote"
}

gonotes() {
  cd ${_NOTES_DIR}
}

quicknote() {
  if [ "$#" -eq 1 ]; then
    echo "Usage: quicknote some name yeah"
    exit 1
  fi
  name=$(_getNoteName $*)
  _openNote ${_NOTES_DIR}/${name} "quicknote"
}

# depends on fzf.sh function rgfzf
fnotes() {
  return=$(rgfzf ${_NOTES_DIR} ${1})
  if [[ -n ${return} ]]; then
    file=$(echo ${return} | cut -d ':' -f 1)
    vim ${file}
  fi
}

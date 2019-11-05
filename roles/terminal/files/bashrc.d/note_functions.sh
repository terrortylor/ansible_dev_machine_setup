# function helper to open a new markdown file based on given name, appends
# date to the file name.
# If a note exists with given name and date then it is opened
#
# TODO support notes with same name but different dates

NOTES_DIR="${HOME}/workspace/notes"

note() {
  if [ ! -z $1 ]; then
    if [ $1 == "-h" ]; then
      echo -e "Usage:\n${FUNCNAME[0]}\t[NOTE_NAME]"
      echo -e "\tNOTE_NAME : Can include the date or not. If the note doesn't exist it will be created."
      echo -e "\n\tIf no name is provided a note with the date is created/opened"
      return 1
    fi
  fi

  local note_name
  note_name=$(note::get_note_name $1)

  if [ ! -f "${NOTES_DIR}/${note_name}" ]; then
    touch "${NOTES_DIR}/${note_name}"
  fi

  $EDITOR "${NOTES_DIR}/${note_name}"
}

# simply lists the notes in the notes dir
note_list() {
  # List all files, sort using '-' as delimeter
  # orderng by year then month then day, and
  # reversing so that newest is at the top
  ls | sort -t- \
    -k3,3 \
    -k2,2 \
    -k1,1 \
    -r
}

# Takes two areguments, first is the user passed in note
# name from command line, second is weather we want regex
# note name or dated note name when first argument not empty
note::build_note_name() {
  # if no name is supplied then use todays date
  if [ -z $1 ]; then
    # no name supplied so just use date
    echo "$(date +%d-%m-%Y).md"
  else
    # if name supplied then build possible note name
    if [ "${2}" -eq 1 ]; then
      echo "*-${1}.md"
    else
      echo "$(date +%d-%m-%Y)-${1}.md"
  fi
fi
}

note::get_note_name() {
  pushd $NOTES_DIR > /dev/null
  local note
  note=$(note::build_note_name "${1}" "1")

  # check if one file exists with name
  found_note=$(ls 2>/dev/null -Ubad1 -- ${note})
  popd > /dev/null

  if [ ! -z "$found_note" ]; then
    # note exists
    echo "${found_note}"
  else
    # note doesn't exist to build dated name
    note=$(note::build_note_name "${1}" "0")
    echo ${note}
  fi
}

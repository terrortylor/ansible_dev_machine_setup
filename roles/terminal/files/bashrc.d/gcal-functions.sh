function gcal-agenda-today {
  watch --color -t -n 3600 '\
    gcalcli --calendar "Alex Tylor" agenda --nodeclined \
    `date +"%m/%d/%Y"` `date +"%m/%d/%Y" -d "+1 day"`\
    '
}

function gcal-agenda-this-week {
  watch --color -t -n 3600 '\
    gcalcli --calendar "Alex Tylor" agenda --nodeclined \
    `date -dlast-monday +"%m/%d/%Y"` `date -dsaturday +"%m/%d/%Y"`\
    '
}


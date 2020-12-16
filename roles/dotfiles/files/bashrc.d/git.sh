function git-update-all() {
  for d in *; do
    echo $d
    if [[ -d "${d}/.git" ]]; then
      pushd $d
      git up
      popd
    fi
  done
}

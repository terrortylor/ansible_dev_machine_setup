git_up_all_directories() {
  for i in $(ls -d */); do
    pushd $i
    git-up
    popd
  done
}

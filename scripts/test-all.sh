#!/bin/bash

pushd roles
for i in $(ls); do
  pushd ${i}
  if [ -f "kitchen.yml" ]; then
    bundle exec kitchen test
  else
    echo "No tests to run for this role"
  fi
  popd
done

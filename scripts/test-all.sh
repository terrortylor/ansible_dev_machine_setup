#!/bin/bash
LOG=/tmp/test.out

pushd roles
for i in $(ls); do
  pushd ${i}
  if [ -f "kitchen.yml" ]; then
    bundle exec kitchen test
    if [ $? -eq 0 ]; then
      echo "${i} passed" >> ${LOG}
    else
      echo "${i} failed" >> ${LOG}
    fi
  else
    echo "No tests to run for this role"
    echo "${i} missing tests" >> ${LOG}
  fi
  popd
done

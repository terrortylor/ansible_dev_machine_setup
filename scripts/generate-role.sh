#!/bin/bash -e

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters, expected 1 got $#"
  echo -e "Usage:\n${FUNCNAME[0]} <ROLE NAME>"
  exit 1
fi

if [ -z ${1} ]; then
  echo "ERROR: Role name can not be empty"
  exit 1
fi

mkdir -p roles/${1}/{defaults,tasks}
touch roles/${1}/defaults/main.yml
cat <<EOF >>roles/${1}/tasks/main.yml
---
EOF

touch roles/${1}/kitchen.yml
cat <<EOF >>roles/${1}/kitchen.yml
---
driver:
  name: vagrant

provisioner:
  name: ansible_playbook
  roles_path: ../../roles
  playbook: test/integration/playbook.yml
  ansible_inventory: test/integration/hosts.ini

verifier:
  name: inspec

platforms:
  - name: generic/ubuntu2010

suites:
  - name: fedora
EOF
mkdir -p roles/${1}/test/integration/fedora
touch roles/${1}/test/integration/fedora/default_spec.rb
touch roles/${1}/test/integration/hosts.ini
cat <<EOF >>roles/${1}/test/integration/hosts.ini
[integration-test]
localhost
EOF
touch roles/${1}/test/integration/playbook.yml
cat <<EOF >>roles/${1}/test/integration/playbook.yml
---
- name: ${1}
  hosts: all
  roles:
  - { role: ${1} }
EOF

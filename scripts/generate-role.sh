#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Illegal number of parameters, expected 2 got $#"
  echo -e "Usage:\n${FUNCNAME[0]} <ROLE NAME> <TAGS>"
  return 1
fi

if [ -z ${1} ]; then
  echo "ERROR: Role name can not be empty"
  exit 1
fi

if [ -z ${2} ]; then
  echo "ERROR: Must supply at least one tag"
  exit 1
fi

mkdir -p roles/${1}/{defaults,tasks}
touch roles/${1}/defaults/main.yml
# touch roles/${1}/tasks/redhat.yml
# touch roles/${1}/tasks/windows.yml
# touch roles/${1}/tasks/osx.yml
# cat <<EOF >>roles/${1}/tasks/main.yml
# ---
# - name: "Fedora tasks"
#   include: redhat.yml
#   when: ansible_os_family == 'RedHat'
#   tags: ${2}, redhat

# - name: "OSX tasks"
#   include: osx.yml
#   when: ansible_os_family == 'Darwin'
#   tags: ${2}, darwin

# - name: "Windows Tasks"
#   include: windows.yml
#   when: ansible_os_family == 'Windows'
#   tags: ${2}, windows
# EOF

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
  - name: generic/fedora32

suites:
  - name: fedora
EOF
mkdir roles/${1}/test/integration/fedora
touch roles/${1}/test/integration/fedora/default_spec.rb
touch roles/${1}/test/integration/hosts.ini
cat <<EOF >>roles/${1}/test/integration/hosts.ini
[integration-test]
localhost
EOF
touch roles/${1}/test/integration/playbook.yml
cat <<EOF >>roles/${1}/test/integration/playbook.yml
---
- name: github_clone
  hosts: all
  roles:
  - { role: ${1} }
EOF

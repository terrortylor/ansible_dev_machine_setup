# What am I

Ansible scripts for configuring my development workstation.

## Linting

Linting should be carried out by `ansible-lint`. If ansible was installed
using this repository then it's accessed via venv:

```bash
source venv/bin/activate
ansible-lint roles/*
```

## Integration Tests

Kitchen is used as the test runner, with vagrant as the provisioner and inspec as the verifier.

To run the tests you'll need to set up the ruby environment:

```bash
rbenv init
bundle install
```

To run tests call kitchen via bundle:

```bash
bundle exec kitchen list
bundle exec kitchen verify <SUITE_NAME>
```

There are tests for most roles (run from within role directory), and root level test to call all roles.

**Requirements**
This project uses rbenv and expects bundler to be installed.
To install dependencies:

```sh
rbenv init
bundle install
```

## Expectations

**File Structure**
The tets use a role called `kitchen` which is used to set up a kitchen test
with files to allow the role being tested to do things like symlinking.

Any test files/dummy folders live within the role themselves, usually under
`test/integration`.

When running the roles against a real target some repositories are expected to
already exist, such as the ansible and vim-environment. I decided to manage
these separately as it fit my use case.

**Run as root**
These role expect to be run as root, and then become the user specified as
required. If you run this as a named user, ensure that you use the `--become`
flag.

## Playbook and inventory files

As this is generally for provisioning a single instance, I just use simple
inventory and playbooks:

## Running

I generally run locally with:

```bash
ansible-playbook -i inventory.ini  playbook.yml --ask-become-pass --limit local
```

or remotely with:

```bash
ansible-playbook -i inventory.ini  playbook.yml --ask-become-pass --limit remote
```

Where the inventory is something along the lines of `example-inventory.yml`

To limit to a particular tag use the `--tags TAG` flag.

## Other...

My old scripts became cumbersome and as they were not tested using them to
provision multiple OS became a chore. As such I've taken the verbose role
route this time, scrapping old scripts and starting afresh with kitchen as the
test runner.

I've tried to script defensively, and for speed... So there are some slightly
odd decisions. Ansible would not be my first choice of tooling but it fit the
bill.

The role `dotfiles` is fairly self explanatory, but I've separated by nvim
environment config for ease of having it in multiple locations (work machine,
phone etc)

## Old Versions

A version that doesn't have tests but was used to spin up OSX and Ubuntu can be
found on the branch: `pre-test-restructure-ubuntu-osx`

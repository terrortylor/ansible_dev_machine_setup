# What am I

Ansible scripts for configuring my dev workstations, which are the following:

* OS X
* Ubuntu (18.04)

As such there are a few things you may want to change/remove!

* VIM - This will set up my neovim environment from another
  [repository](https://github.com/terrortylor/vim-environment). To remove this
  take a look at the `vim` role.

## Preparation

As this is designed to run on both OS X and Ubuntu, there are two setup guides:

### OS X Specific

This is an Ansible project used to configure a mac used for development.
Where possible homebrew is used as a package manager.

Enable SSH:

```bash
sudo systemsetup -setremotelogin on
```

Connect to instance as your user, accepting keys:

```bash
ssh -o "StrictHostKeyChecking no" $USER@127.0.0.1
```

Additional: Install xcode
Basically you need this to run the local git installation...
So haveing checked this out, it's likely that you've already got it installed.

```bash
xcode-select --install
```

Install pip, and anisble:

```bash
sudo easy_install pip
sudo pip install ansible
```

This was setup with:

```bash
ansible 2.7.10
```

### Ubuntu

Install git:

```bash
sudo apt-get install git
```

Enable ssh:

```bash
sudo apt install openssh-server
ssh -o "StrictHostKeyChecking no" $USER@127.0.0.1
```

Install Ansible:

```bash
sudo apt-get install ansible
```

### Create an ansible hosts file

Create a hosts file. There is an example host file called **hosts.example**.
Copy this to **/etc/ansible/hosts** or use the **-i** flag to indicate where
the hosts file is.

### SSH keys

This script checks out a repository or two... and depends on your ssh keys
being in place.

## Configuration Management

Run the ansible playbook:

```bash
ansible-playbook dev.yml -K
```

Run the ansbile playbook, using tags:

```bash
ansible-playbook dev.yml -K --tags packages
```

### Roles/Tags

The following roles exists:

* packages - installs a number of packages for os x
* terminal - sets up dot files etc
* atom - installs packages for atom
* vim - tried to keep all vim set up tasks like checking out vim config,
  installing packages, symlinking files etc in this role. Has a dependency
  on 'packages' roles.

#### vim

Check out the [repository](https://github.com/terrortylor/vim-environment)
tl;dr my neovim config... I've removed vim config in favour of neovim config
now ヘ（。□°）ヘ

This role sets up vim required packages etc. Don't just copy, learn vim first!
That being said most of these are to support LSP within vim, the plugin on choice
here is [COC](https://github.com/neoclide/coc.nvim).

Currently this has support (on some level) for:

* markdown
* go
* yaml - linting
* json - linting
* ruby

## Stuff not automated (yet...?)

* Android Dev : To set up the Android SDK this is done via Android Studio as
  per [this link](https://facebook.github.io/react-native/docs/getting-started.html);
  depending on what SDK version is required.

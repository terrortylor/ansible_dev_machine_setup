# What am I?
Ansible scripts for configuring dev workstations.
Supporting:
* OS X
* Ubuntu (18.04)

# Preperation
As this is designed to run on both OS X and Ubuntu, there are two setup guides:

## OS X Specific
This is an Ansible project used to configure a mac used for development.
Where possible homebrew is used as a package manager.

Enable SSH:
```
sudo systemsetup -setremotelogin on
```

Connect to instance as your user, accepting keys:
```
ssh -o "StrictHostKeyChecking no" $USER@127.0.0.1
```

Additional: Install xcode
Basically you need this to run the local git installation...
So haveing checked this out, it's likely that you've already got it installed.
```
xcode-select --install
```

Install pip, and anisble:
```
sudo easy_install pip
sudo pip install ansible
```

This was setup with:
```
ansible 2.7.10
```

## Ubuntu
Install git:
```
sudo apt-get install git
```

Enable ssh:
```
sudo apt install openssh-server
ssh -o "StrictHostKeyChecking no" $USER@127.0.0.1
```

Install Ansible:
```
sudo apt-get install ansible
```


Create a hosts file. There is an example host file called **hosts.example**. Copy this to **/etc/ansible/hosts** or use the **-i** flag to indicate where the hosts file is.

# Configuration Management
There are two playbooks:
* dev_mac.yml
* dev_ubuntu.yml

Use the relevant playbook...

Run the ansible playbook:
```
ansible-playbook dev_mac.yml -K
```

Run the ansbile playbook, using tags:
```
ansible-playbook dev_mac.yml -K --tags homebrew
```

## Roles/Tags
The following roles exists:

* homebrew - installs a number of packages for os x
* snap_packages - installs a number of packages for Ubuntu
* terminal - sets up dot files etc
* npm - installs npm packages
* atom_packages - installs plackages for atom

## config.yml
This files is used to drive the configuration of the various roles.
Each role has a *defaults/main.yml* file so roles can be lifted out, and examples of the configuration structure is available.
Modify packages etc here.

# Stuff not automated (yet...?)
## Android Dev
To set up the Android SDK this is done via Android Studio as per [this link](https://facebook.github.io/react-native/docs/getting-started.html); depending on what SDK version is required.

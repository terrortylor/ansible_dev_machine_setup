# OS X Setup

# Pre-requisites
Enable SSH:
```
sudo systemsetup -setremotelogin on
```

Connect to instance as your user, accepting keys:
```
ssh -o "StrictHostKeyChecking no" $USER@127.0.0.1
```

Install pip, and anisble:
```
sudo easy_install pip
sudo pip install ansible
```

This was setup with:
```ansible 2.7.10```

Additional: Install xcode
Basically you need this to run the local git installation...
So haveing checked this out, it's likely that you've already got it installed.
```
xcode-select --install
```

# Configuration Management
Install ansible dependencies:
```
ansible-galaxy install -r requirements.yml
```

Run the ansible playbook:
```
ansible-playbook home.yml -i inventory -K
```

# Notes
* Based off Jeff Geerling's ansible playbook, which in turn used his ansible homebrew role... also his was the book I read on Ansible when I had to review a consultancy's Ansbile code they were writing for a client. FYI their code was not good

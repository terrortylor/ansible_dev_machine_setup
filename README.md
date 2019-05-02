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

Run the ansbile playbook, using tags:
```
ansible-playbook home.yml -i inventory -K --tags homebrew
```

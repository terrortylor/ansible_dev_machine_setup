describe file('/home/vagrant/.inputrc') do
  it { should exist }
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/personnal-workspace/ansible/roles/dotfiles/files/inputrc' }
end

describe file('/home/vagrant/.bashrc') do
  it { should exist }
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/personnal-workspace/ansible/roles/dotfiles/files/bashrc' }
end

describe file('/home/vagrant/.bashrc.d') do
  it { should exist }
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/personnal-workspace/ansible/roles/dotfiles/files/bashrc.d' }
end

describe file('/home/vagrant/bin') do
  it { should exist }
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/personnal-workspace/ansible/roles/dotfiles/files/bin' }
end

describe file('/home/vagrant/.gitconfig') do
  it { should exist }
end

describe file('/home/vagrant/.config/git') do
  it { should exist }
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/personnal-workspace/ansible/roles/dotfiles/files/git' }
end

describe file('/home/vagrant/.tmux.conf') do
  it { should exist }
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/personnal-workspace/ansible/roles/dotfiles/files/tmux/tmux.conf' }
end

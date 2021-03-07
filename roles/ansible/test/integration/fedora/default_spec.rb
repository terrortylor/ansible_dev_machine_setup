describe package('ansible') do
  it { should be_installed }
end

describe package('python3-pip') do
  it { should be_installed }
end

describe pip('virtualenv') do
  it { should be_installed }
end

describe pip('ansible-lint', '/home/vagrant/personnal-workspace/ansible/venv/bin/pip') do
  it { should be_installed }
end

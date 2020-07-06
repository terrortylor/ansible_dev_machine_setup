%w[gcc make perl].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe package('vagrant') do
  it { should be_installed }
  its('version') { should eq '2.2.9-1.fc32' }
end

describe file('/etc/yum.repos.d/virtualbox.repo') do
  it { should exist }
end

describe file('/usr/bin/VBoxManage') do
  it { should exist }
end

describe command('VBoxManage -v') do
  its('stdout') { should match /6.1.12r139181/ }
end

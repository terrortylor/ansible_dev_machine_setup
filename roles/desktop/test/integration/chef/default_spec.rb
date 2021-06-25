%w[gcc make perl vagrant].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe file('/usr/bin/VBoxManage') do
  it { should exist }
end

describe command('VBoxManage -v') do
  its('stdout') { should match /6.1.22_Ubuntur144080/ }
end

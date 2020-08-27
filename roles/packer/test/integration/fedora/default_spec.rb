describe file('/usr/local/bin/packer') do
  it { should exist }
end

describe command('packer -v') do
  its('stdout') { should include '1.6.1' }
end

describe package('pykickstart') do
  it { should be_installed }
end

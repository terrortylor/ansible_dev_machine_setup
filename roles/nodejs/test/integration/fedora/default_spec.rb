describe file("/home/vagrant/.nvm/nvm.sh") do
  it { should be_exist }
end

describe command('bash -ic "node -v"') do
  its('stdout') { should include 'v12.21.0' }
end

%w[moby-engine docker-compose].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe firewalld.where { zone == 'trusted' } do
  its('interfaces') { should include ['docker0'] }
end

describe command('firewall-cmd --zone=FedoraWorkstation --query-masquerade') do
   its('stdout') { should match ('yes') }
end

describe group('docker') do
  it { should exist }
  its('members') { should include 'vagrant' }
end

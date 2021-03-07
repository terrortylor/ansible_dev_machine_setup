describe file('/home/vagrant/.sdkman') do
  it { should exist }
  it { should be_directory }
end

describe file('/home/vagrant/.sdkman/etc/config') do
  it { should exist }
  its('content') { should match /^sdkman_auto_answer=true$/ }
end

%w[11.0.10-zulu].each do |java|
  describe file("/home/vagrant/.sdkman/candidates/java/#{java}") do
  it { should exist }
  end
end

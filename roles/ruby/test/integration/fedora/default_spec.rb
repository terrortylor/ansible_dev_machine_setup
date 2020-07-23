describe file('/home/vagrant/.rvm/bin/rvm') do
  it { should exist }
end

%w[ruby-2.5.1 ruby-2.6.6 ruby-2.7.0].each do |ruby|
  describe file("/home/vagrant/.rvm/rubies/#{ruby}") do
  it { should exist }
  end
end

describe file('/home/vagrant/.rvm/gems/default') do
  it { should be_symlink }
  its('link_path') { should eq '/home/vagrant/.rvm/gems/ruby-2.7.0' }
end

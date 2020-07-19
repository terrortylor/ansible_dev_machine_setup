describe file('/usr/local/rvm/bin/rvm') do
  it { should exist }
end

%w[ruby-2.5.1 ruby-2.7.0].each do |ruby|
  describe file("/usr/local/rvm/rubies/#{ruby}") do
  it { should exist }
  end
end

describe file('/usr/local/rvm/gems/default') do
  it { should be_symlink }
  its('link_path') { should eq '/usr/local/rvm/gems/ruby-2.7.0' }
end

describe package('google-chrome-stable') do
  it { should be_installed }
end

describe file('/usr/bin/slack') do
  it { should exist }
end

%w[remmina anki].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

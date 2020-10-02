describe package('google-chrome-stable') do
  it { should be_installed }
end

describe package('slack') do
  it { should be_installed }
end

%w[remmina anki].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

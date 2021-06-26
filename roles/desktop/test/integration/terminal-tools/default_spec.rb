%w[tmux fzf bat nmap lastpass-cli].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

%w[rg fdfind].each do |binary|
  describe file("/usr/bin/#{binary}") do
    it { should exist }
  end
end

%w[lazygit gron].each do |binary|
  describe file("/usr/local/bin/#{binary}") do
    it { should exist }
  end
end

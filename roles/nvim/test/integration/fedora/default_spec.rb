describe file('/home/vagrant/.config') do
  it { should be_directory }
end

describe file('/home/vagrant/personnal-workspace/neovim-source') do
  it { should be_directory }
end

describe file('/home/vagrant/.config/nvim') do
  it { should be_symlink }
end

%w[neovim python3-neovim cmake].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

%w[busted luacheck].each do |luapack|
  describe file("/usr/bin/#{luapack}") do
    it { should exist }
  end
end

# Language server related
%w[diagnostic-languageserver typescript typescript-language-server].each do |npmpack|
  describe command("bash -ic 'npm list -g --depth 0'") do
    its('stdout') { should include npmpack }
  end
end

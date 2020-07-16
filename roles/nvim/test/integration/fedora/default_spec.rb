describe file('/home/vagrant/.config') do
  it { should be_directory }
end

describe file('/home/vagrant/.config/nvim') do
  it { should be_symlink }
end

%w[neovim python3-neovim].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

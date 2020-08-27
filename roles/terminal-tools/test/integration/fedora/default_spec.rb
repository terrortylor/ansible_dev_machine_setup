%w[lazygit tmux fzf bat fd].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe file('/etc/yum.repos.d/_copr:copr.fedorainfracloud.org:atim:lazygit.repo') do
  it { should exist }
end

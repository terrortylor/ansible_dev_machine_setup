%w[docker-ce docker-ce-cli containerd.io].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

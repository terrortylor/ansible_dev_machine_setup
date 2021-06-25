%w[remmina anki].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

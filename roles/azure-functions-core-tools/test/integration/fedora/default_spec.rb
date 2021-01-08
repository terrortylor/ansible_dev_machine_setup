%w[func gozip].each do |bin|
  describe file("/usr/local/bin/#{bin}") do
    it { should exist }
    its('mode') { should cmp '0755' }
  end
end

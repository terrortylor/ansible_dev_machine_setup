describe file("/usr/local/bin/notary") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

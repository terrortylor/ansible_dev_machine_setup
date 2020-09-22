describe file("/usr/local/bin/k9s") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

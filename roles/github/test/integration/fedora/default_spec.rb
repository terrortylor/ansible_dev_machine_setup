describe file("/usr/local/bin/gh") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

describe file("/usr/local/bin/helm") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

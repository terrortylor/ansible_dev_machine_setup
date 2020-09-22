describe file("/usr/local/bin/kubectl") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

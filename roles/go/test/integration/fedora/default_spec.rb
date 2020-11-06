describe file("/usr/local/go") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

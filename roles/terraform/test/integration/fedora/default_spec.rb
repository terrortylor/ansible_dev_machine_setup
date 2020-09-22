describe file("/usr/local/bin/terraform") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

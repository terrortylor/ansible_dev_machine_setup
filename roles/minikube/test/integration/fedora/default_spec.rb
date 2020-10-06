describe file("/usr/local/bin/minikube") do
  it { should exist }
  its('mode') { should cmp '0755' }
end

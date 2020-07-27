describe package('lazygit') do
  it { should be_installed }
end

describe file('/etc/yum.repos.d/_copr:copr.fedorainfracloud.org:atim:lazygit.repo') do
  it { should exist }
end

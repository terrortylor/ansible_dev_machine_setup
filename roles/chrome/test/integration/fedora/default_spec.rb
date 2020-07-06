describe package('fedora-workstation-repositories') do
  it { should be_installed }
end

describe package('google-chrome-stable') do
  it { should be_installed }
end

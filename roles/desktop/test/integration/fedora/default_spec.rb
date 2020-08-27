describe package('google-chrome-stable') do
  it { should be_installed }
end

describe package('slack') do
  it { should be_installed }
end

describe package('remmina') do
  it { should be_installed }
end

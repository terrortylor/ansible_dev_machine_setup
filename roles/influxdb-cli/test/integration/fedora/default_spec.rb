describe file('/usr/local/bin/influx') do
  it { should exist }
end

describe command('influx -version') do
  its('stdout') { should include '1.8.1' }
end

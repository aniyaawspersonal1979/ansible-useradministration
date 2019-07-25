# Testing the users
usernames = ["test","kitchen","root"]
usernames.each do |name|
    describe user(name) do
        it { should exist }
    end
end

# Testing the groups
group_names = ["dbadmin","networkadmin","sysadmin"]
group_names.each do |name|
    describe group(name) do
      it { should exist }
end
end

# Check sudoers file existance
describe file('/etc/sudoers') do
  it { should exist }
end

# Check sshd_config file existance
describe file('/etc/ssh/sshd_config') do
  it { should exist }
end

# Checking sshd_config content
ssh_users = 'ansible vinod_dbdevops ec2-user test'
describe sshd_config do
  its('PasswordAuthentication') { should eq  'yes' }
  its('AllowUsers') { should eq ssh_users }
end

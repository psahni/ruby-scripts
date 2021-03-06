##############################################################
# Run a remote command on the remote server
# Dependency - net-ssh gem
##############################################################

require 'rubygems'
require 'net/ssh'

@hostname = "test.example.com"
@username = "username"
@password = "password"
@cmd = "ls -al"



begin
  ssh = Net::SSH.start(@hostname, @username, :password =>      @password)
  res = ssh.exec!(@cmd)
  ssh.close
  puts res
rescue
  puts "Unable to connect to #{@hostname} using #{@username}/#  {@password}"
end

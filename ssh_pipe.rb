require 'rubygems'
require 'net/ssh'

# server config
@hostname = ""
@username = ""
@password = ""

@commands = nil

# read commands from file
file = File.open("C:\\Users\\Standard Guy\\Desktop\\Scripts\\show_all_rules.sh", "r")
@commands = file.read
file.close

begin
	ssh = Net::SSH.start(@hostname, @username, :password => @password)
	commandOutput = ssh.exec!(@commands)
	puts commandOutput 
	ssh.close
rescue
	puts "Unable to connect to #{@hostname}"
end

sleep(10)
  
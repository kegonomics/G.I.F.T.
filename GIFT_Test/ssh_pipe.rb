require 'rubygems'
require 'net/ssh'

# config
@hostname = ARGV[0] # "10.0.0.20"
@username = ARGV[1]
@password = ARGV[2]
@scriptPath = ARGV[3] || "C:\\Users\\Standard Guy\\Documents\\GIFT_Test\\Scripts\\show_all_rules.sh"

# read commands from file
script = File.open(@scriptPath, "r")
@commands = script.read
script.close

begin
	ssh = Net::SSH.start(@hostname, @username, :password => @password)
	serverOutput = ssh.exec!(@commands)
	
	# write output to file
	file = File.open("output.txt", "w")
	file.write(serverOutput)
	file.close
	
	puts serverOutput
	ssh.close
rescue
	puts "Unable to connect to #{@hostname}"
end
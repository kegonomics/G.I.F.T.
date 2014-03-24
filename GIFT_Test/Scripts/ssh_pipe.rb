require 'rubygems'
require 'net/ssh'

# config
@hostname = ARGV[0] # "10.0.0.20"
@username = ARGV[1]
@password = ARGV[2]
@commands = ARGV[3]

@commands = showInputRules()

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

# Show

def showInputRules()
   return "iptables -L INPUT --line-numbers -n"
end

# Add

# Delete 


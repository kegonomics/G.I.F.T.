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
	#serverOutput = ssh.exec!(@commands)

	ssh.open_channel do |channel|
		channel.exec("ls") do |ch, success|
			abort "could not execute command" unless success

			channel.on_data do |ch, data|
				puts "got stdout: #{data}"
				channel.send_data "ls -al"
			end

			channel.on_extended_data do |ch, type, data|
				puts "got stderr: #{data}"
			end

			channel.on_close do |ch|
				puts "channel is closing!"
			end
		end
	end

	ssh.loop
	
	# write output to file
	file = File.open("output.txt", "w")
	file.write(serverOutput)
	file.close
	
	puts serverOutput
	ssh.close
rescue
	puts "Unable to connect to #{@hostname}"
end
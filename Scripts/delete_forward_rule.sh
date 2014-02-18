#!/bin/bash

# Script allows the deletion of a FORWARD chain rule by line number

# check for cli args
if [ $1 ]; then
	lineNumber=$1
else
	echo	
	sudo iptables -L FORWARD --line-numbers -n 	# display FORWARD chain rules	
	echo
	echo "Enter a line number to delete:"
	read lineNumber 				# gets user input and stores it in "lineNumber"
fi

# deletes the rule at the given line
sudo iptables -D FORWARD $lineNumber

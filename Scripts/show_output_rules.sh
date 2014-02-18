#!/bin/bash

echo
sudo iptables -L OUTPUT --line-numbers -n 	# List all OUTPUT chain rules
echo

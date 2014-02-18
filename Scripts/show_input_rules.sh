#!/bin/bash

echo
sudo iptables -L INPUT --line-numbers -n 	# List all INPUT chain rules
echo

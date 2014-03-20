#!/bin/bash

echo
iptables -L OUTPUT --line-numbers -n 	# List all OUTPUT chain rules
echo

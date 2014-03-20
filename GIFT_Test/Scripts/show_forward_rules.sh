#!/bin/bash

echo
iptables -L FORWARD --line-numbers -n 	# List all FORWARD chain rules
echo

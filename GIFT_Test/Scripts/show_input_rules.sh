#!/bin/bash

echo
iptables -L INPUT --line-numbers -n 	# List all INPUT chain rules
echo

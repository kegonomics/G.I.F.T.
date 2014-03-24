#!/bin/bash

# Script allows the deletion of an INPUT chain rule by line number

# set CLI argument as variable
lineNumber=$1

# deletes the rule at the given line
iptables -D INPUT $lineNumber

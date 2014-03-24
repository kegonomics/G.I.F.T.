#!/bin/bash

# Script allows the deletion of a FORWARD chain rule by line number

# Set CLI argument as a variable
lineNumber=$1


# deletes the rule at the given line
iptables -D FORWARD $lineNumber

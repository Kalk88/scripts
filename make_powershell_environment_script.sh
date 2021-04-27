#!/usr/bin/env bash

# Reads environment variables from a file and outputs a script for setting the variables as system variables in windows.
# Expected format is name value, one per line.
# Example command ./make_powershell_environment_script.sh args.txt my_file_name

set -o errexit
set -o nounset

ARGSFILE=$1
OUTPUT=$2

echo "\n Creating bash system variable file with name $OUTPUT from args in: $ARGSFILE"
awk '{print "setx " $1 " " $2 " /m"}' $ARGSFILE > $OUTPUT.ps1
exit 0

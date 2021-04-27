#!/usr/bin/env bash

# Reads environment variables from a file and outputs a script for setting the variables as system variables in unix.
# Expected format is name value, one per line.
# Example command ./make_unix_environment_script.sh args.txt my_file_name

set -o errexit
set -o nounset

ARGSFILE=$1
OUTPUT=$2

echo "Creating bash system variable file with name $OUTPUT.sh from args in: $ARGSFILE"
awk '{print "export " $1"="$2}' $ARGSFILE > $OUTPUT.sh
exit 0

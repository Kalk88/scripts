#!/usr/bin/env bash

set -o errexit
set -o nounset
# watch file(s) given by arg1 and run command from arg2 on event modification.
FOLDER=${1}
COMMAND=${2}
echo  Watching ${FOLDER}, running ${COMMAND} on changes...
inotifywait -e modify -r -m ${FOLDER} |
while read dir event file; do
        # dir event file is the format of inotifywait events. but we only watch
        # for modify events so we can always run the given command.
        # create a subshell and run the command from the script callers location
        $(cd $(pwd) && echo "${COMMAND}")
done


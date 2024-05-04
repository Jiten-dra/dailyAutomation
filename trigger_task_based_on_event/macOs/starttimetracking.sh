#!/bin/bash
echo "starting"
# open -a Terminal --args -e "bash -c '/Users/jitendra/myFiles/myScript/agents/timetracking.sh'"
osascript -e 'tell app "Terminal"
    do script "<path to timetracking.sh>"
end tell'
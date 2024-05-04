#!/bin/bash
# check file
fileToCheck="$HOME/timetracking.txt"

if  ! [ -f "$fileToCheck" ]; then
    echo "not exist so created"
    touch "$fileToCheck"
fi

echo "Tag your last 30 minutes"
read -r timetag
echo "$timetag" >> "$fileToCheck"
echo "work tag updated to $fileToCheck"
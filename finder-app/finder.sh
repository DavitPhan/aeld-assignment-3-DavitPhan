#!/bin/bash

if [ -d "$1" ] && [ -n "$2" ]
then
    x=$(grep -rc "$2" "$1" | grep -v ":0" | wc -l)
    # TODO: change the 3rd grep.
    # AWK command found on stackoverflow: https://stackoverflow.com/questions/2702564/how-can-i-quickly-sum-all-numbers-in-a-file
    y=$(grep -rc "$2" "$1" | grep -v ":0" | grep -oE [0-9]+$ | awk '{ sum += $1 } END { print sum }')
    echo The number of files are $x and the number of matching lines are $y
    exit 0
else
    exit 1
fi
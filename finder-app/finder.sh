#!/bin/bash
# finder.sh - Search for a text string in a specified directory and its subdirectories

# Check if both arguments were provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir represents a valid directory on the filesystem
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory '$filesdir' does not exist."
    exit 1
fi

# Count the number of files in the directory and subdirectories
# -type f restricts the count to files only
num_files=$(find "$filesdir" -type f | wc -l)

# Count total matching lines containing searchstr across all files
# -r enables recursive searching, -I ignores binary files
num_matching_lines=$(grep -rI "$searchstr" "$filesdir" | wc -l)

# Print the result
echo "The number of files are ${num_files} and the number of matching lines are ${num_matching_lines}"
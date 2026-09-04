#!/bin/bash
# writer.sh - Writes a specified string to a file, creating directories if needed

# Check if both arguments were provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the full file path
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't already exist
if ! mkdir -p "$dirpath"; then
    echo "Error: Could not create directory path '$dirpath'."
    exit 1
fi

# Write the string to the file, overwriting any existing file
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not write to file '$writefile'."
    exit 1
fi
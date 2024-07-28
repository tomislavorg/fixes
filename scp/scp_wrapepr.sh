#!/bin/bash

# Function to display usage
display_usage() {
    echo "Usage: $0 [scp options] source destination"
    echo "This script wraps the scp command and provides additional information."
    echo "Use the same options and arguments as you would with scp."
}

# Check if help is requested
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    display_usage
    exit 0
fi

# Check if at least two arguments are provided (source and destination)
if [ "$#" -lt 2 ]; then
    echo "Error: Insufficient arguments."
    display_usage
    exit 1
fi

# Get the source and destination
SOURCE="${@: -2:1}"
DEST="${@: -1}"

# Function to expand path
expand_path() {
    if [[ "$1" == *":"* ]]; then
        # Remote path
        echo "$1"
    else
        # Local path
        echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
    fi
}

# Expand paths
EXPANDED_SOURCE=$(expand_path "$SOURCE")
EXPANDED_DEST=$(expand_path "$DEST")

# Display information
echo "SCP Wrapper Script"
echo "=================="
echo "Source: $EXPANDED_SOURCE"
echo "Destination: $EXPANDED_DEST"
echo "Command to be executed: scp $@"
echo "Starting transfer..."

# Start time
START_TIME=$(date +%s)

# Run scp with all original arguments
scp "$@"
SCP_EXIT_CODE=$?

# End time
END_TIME=$(date +%s)

# Calculate duration
DURATION=$((END_TIME - START_TIME))

# Display results
echo "=================="
if [ $SCP_EXIT_CODE -eq 0 ]; then
    echo "Transfer completed successfully."
else
    echo "Transfer failed with exit code $SCP_EXIT_CODE."
fi
echo "Duration: $DURATION seconds"

# If it's a file transfer (not a directory), show file size
if [ -f "$SOURCE" ]; then
    SIZE=$(du -h "$SOURCE" | cut -f1)
    echo "File size: $SIZE"
fi

exit $SCP_EXIT_CODE
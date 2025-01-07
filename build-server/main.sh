#!/bin/bash
set -e  # Exit on any error

# Check if GIT_REPOSITORY_URL is provided
if [ -z "$GIT_REPOSITORY_URL" ]; then
    echo "Error: GIT_REPOSITORY_URL environment variable is not set"
    exit 1
fi

# Print debug information
echo "Starting deployment process..."
echo "Repository URL: $GIT_REPOSITORY_URL"
echo "Working directory: $(pwd)"

# Create output directory if it doesn't exist
mkdir -p /home/app/output

# Clone the repository
echo "Cloning repository..."
git clone "$GIT_REPOSITORY_URL" /home/app/output

# Check if clone was successful
if [ ! -d "/home/app/output" ]; then
    echo "Error: Git clone failed"
    exit 1
fi

# List contents for debugging
echo "Contents of output directory:"
ls -la /home/app/output

# Execute the Node.js script
echo "Starting Node.js script execution..."
exec node /home/app/script.js

# Note: The exec command replaces the shell with the node process,
# so any code after this point won't be executed
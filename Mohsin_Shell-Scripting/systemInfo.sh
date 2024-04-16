#!/bin/bash

# Function to display system information
system_info() {
    echo "User: $(whoami)"
    echo "Hostname: $(hostname)"
    echo "Operating System Version: $(uname -r)"
}

# calling fuction
system_info

# Loop to update system information periodically (every minute)
while true; do
    sleep 60  # Wait for 60 seconds
    clear
    system_info
done
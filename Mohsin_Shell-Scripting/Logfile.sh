#!/bin/bash

# Function to analyze the log file
analyze_log() {
    log_file="$1"
    
    # Extract IP addresses, request URLs, and error codes
    ip_addresses=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr)
    request_urls=$(awk '{print $7}' "$log_file" | sort | uniq -c | sort -nr)
    error_codes=$(awk '{print $9}' "$log_file" | sort | uniq -c | sort -nr)
    
    # Display the analysis results
    echo "Most frequent IP addresses:"
    echo "$ip_addresses"
    echo ""
    echo "Most frequent request URLs:"
    echo "$request_urls"
    echo ""
    echo "Error codes and their occurrence counts:"
    echo "$error_codes"
}

# Main function
main() {
    log_file="$1"
    if [ ! -f "$log_file" ]; then
        echo "Error: Log file not found!"
        exit 1
    fi
    
    analyze_log "$log_file"
}

# Check if a log file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 /var/log/auth.log"
    exit 1
fi

main "$1"

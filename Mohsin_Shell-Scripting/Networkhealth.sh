#!/bin/bash

# Function for ping host 
ping_host() {
    host="$1"
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    if ping -c 1 "$host" >/dev/null 2>&1; then
        echo "$timestamp: Ping to $host successful"
    else
        echo "$timestamp: Ping to $host failed"
        
        # Log the failure to a file
        echo "$timestamp: Ping to $host failed" >> network_health.log
        # Send an alert via email (modify as needed)
        echo "Alert: Ping to $host failed at $timestamp" | mail -s "Network Health Alert" mohsinaliarab@gmail.com
    fi
}

# List of predefined IPs or domain names to ping
hosts=("example.com" "157.240.3.35" "google.com")

# loop to ping each host and check network health
while true; do
    for host in "${hosts[@]}"; do
        ping_host "$host"
    done
    
    sleep 60
done

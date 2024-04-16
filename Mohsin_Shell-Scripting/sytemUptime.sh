#!/bin/bash

# created Function
System_uptime() {
        # Get system uptime using the uptime command
        uptime_output=$(uptime)
        # Display the system uptime
        echo "System Uptime: $uptime_output"
}

# used while Loop
while true; do
        System_uptime
        sleep 5  # Refresh every 5 sec
done
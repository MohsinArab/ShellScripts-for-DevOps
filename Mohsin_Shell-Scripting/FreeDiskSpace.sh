#!/bin/bash

# created function for free desk space
disk_space() {
    partition="$1"
    free_space=$(df -BM "$partition" | awk 'NR==2 {print $4}')
    echo "Free disk space on $partition: $free_space"
}

# first function call
disk_space /

# Loop to update disk space information periodically
while true; do
    sleep 60  # update after 1 minitue
    display_disk_space /
done
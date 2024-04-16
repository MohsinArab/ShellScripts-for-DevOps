#!/bin/bash

# created a function to display the countdown timer
countdown_timer() {
    echo -ne "Time remaining: $1 seconds\r"
}

# Prompt the user for a duration in seconds
read -p "Enter the duration in seconds: " duration

# Loop to display the countdown timer
for ((i = duration; i >= 0; i--)); do
    countdown_timer "$i"
    sleep 1  # Update every second
done

# Print a newline after the countdown finishes
echo ""

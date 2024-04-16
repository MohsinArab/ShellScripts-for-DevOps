#!/bin/bash

time_Announcer() {
        # comment for the current time
        current_time=$(date "+%A, %d %B %Y %I:%M %p")
        # comment for personalized greeting
        echo "Hello, $USER! It's $current_time."
}

# update every minute using loop
while true; do
        time_Announcer
        sleep 60  # Update after 60 seconds
done
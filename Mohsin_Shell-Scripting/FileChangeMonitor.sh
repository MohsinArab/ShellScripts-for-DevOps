#!/bin/bash

# created function to print a message when the file is modified
file_change() {
    echo "File has been modified!"
}

# Initial modification time of the file
initial_mtime=$(stat -c %Y "$1")

# loop for monitor the file
while true; do
    # current modification time
    current_mtime=$(stat -c %Y "$1")

    # modification time check
    if [ "$current_mtime" != "$initial_mtime" ]; then
        file_change
        
        # update the initial modification time
        initial_mtime="$current_mtime"
    fi

    sleep 1
done
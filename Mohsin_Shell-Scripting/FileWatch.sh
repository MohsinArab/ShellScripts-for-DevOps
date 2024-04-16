#!/bin/bash

#file path
file_to_monitor="/home/ubuntu/dir1/file01"

#first modification
initial_mtime=$(stat -c %Y "$file_to_monitor")

#function
update_message(){
        echo "The file '$file_to_monitor' has been modified"
}

#loop
while true; do
        current_mtime=$(stat -c %Y "file_to_monitor")

        if ["$current_mtime" -gt "$initial_mtime"]; then
                update_message

                initial_mtime="$current_mtime"

        fi

        sleep 1
done
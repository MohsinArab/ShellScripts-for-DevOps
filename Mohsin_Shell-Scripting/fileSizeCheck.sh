#!/bin/bash

# written a function to check the file size and displayed in real-time
file_size_check() {
    file_size=$(du -s "$1" 2>/dev/null | awk '{print $1}')
    # Printed the file size
    echo -ne "File size: ${file_size:-0} bytes\r"
}

# entering a file path
echo "Enter the file path: "
read -r file_path

# loop to update the file size
while true; do
    file_size_check "$file_path"
    sleep 1  # Refresh every second

    # Check if the file path has been updated (using backspace for corrections)
    read -rsn1 -t 0.1 key
    if [[ $key == $'\x7f' ]]; then  # Check for backspace key
        # Trim the last character from the file path
        file_path="${file_path%?}"
    elif [[ -n $key ]]; then
        # Append the pressed key to the file path
        file_path+="$key"
    fi
done

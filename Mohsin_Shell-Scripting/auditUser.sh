#!/bin/bash

# Function to audit user accounts
audit_user_accounts() {
    echo "User accounts audit:"
    echo "-------------------"
    # List of all users
    last | awk '!seen[$1]++ {print $1, $4, $5, $6, $7}'
    echo ""
}

# Function to audit file permissions in sensitive directories
audit_file_permissions() {
    echo "File permissions audit in sensitive directories:"
    echo "----------------------------------------------"
    # Define sensitive directories
    sensitive_directories=("/etc" "/var")

    # Check file permissions in sensitive directories
    for directory in "${sensitive_directories[@]}"; do
        echo "Files in $directory with too permissive permissions:"
        find "$directory" -type f -perm /o+w -exec ls -l {} + | awk '{print $1, $NF}'
        echo ""
    done
}

# Main function
main() {
    audit_user_accounts
    audit_file_permissions
}

# calling main function
main

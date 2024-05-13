#!/bin/bash

# Function to check for suspicious network connections
check_network() {
    # Use netstat to get a list of currently active connections
    connections=$(netstat -tuln)

    # Check each connection for suspicious activity
    while read -r line; do
        # Example: Check if there's an active connection on port 1337
        if echo "$line" | grep -q ":1337 "; then
            echo "Suspicious connection detected: $line"
            # You can add more actions here, such as blocking the IP or logging to another file
        fi
    done <<< "$connections"
}

# Continuously monitor network connections
while true; do
    check_network
    # Adjust the sleep duration according to your monitoring requirements
    sleep 5
done

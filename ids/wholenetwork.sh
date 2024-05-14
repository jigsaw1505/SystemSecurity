#!/bin/bash

# Set the logfile path
LOGFILE="/var/log/network_intrusion.log"

# Function to log suspicious connections
log_intrusion() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") Intrusion detected: $1" >> "$LOGFILE"
}

# Main loop to monitor network traffic
while true; do
    # Capture network traffic using tcpdump
    tcpdump -n -c 1000 >> /tmp/network_traffic.log 2>/dev/null

    # Analyze the captured traffic for suspicious patterns
    suspicious_traffic=$(cat /tmp/network_traffic.log | grep -E 'malicious_pattern1|malicious_pattern2')

    # If suspicious traffic is detected, log it
    if [ -n "$suspicious_traffic" ]; then
        log_intrusion "$suspicious_traffic"
    fi

    # Clear the temporary log file
    > /tmp/network_traffic.log

    # Sleep for 1 minute before capturing traffic again
    sleep 60
done

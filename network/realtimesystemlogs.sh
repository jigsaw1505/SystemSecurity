#!/bin/bash

# Set the logfile path
LOGFILE="/var/log/syslog"

# Function to log suspicious activity
log_suspicious_activity() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") Suspicious activity detected: $1" >> "/var/log/suspicious_activity.log"
}

# Main loop to monitor system logs
while true; do
    # Use 'tail' to continuously monitor the last few lines of the syslog
    tail -n 10 "$LOGFILE" | while read line; do
        # Check for suspicious patterns or indicators of unauthorized access
        if [[ "$line" =~ "authentication failure" || "$line" =~ "Failed password" ]]; then
            log_suspicious_activity "$line"
        fi
        # Add more patterns or conditions as needed
    done

    # Sleep for 1 minute before checking logs again
    sleep 60
done

#!/bin/bash

# Set the logfile path
LOGFILE="/var/log/syslog"

# Function to log potential vulnerabilities or indicators of compromise
log_vulnerability() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") Potential vulnerability detected: $1" >> "/var/log/potential_vulnerabilities.log"
}

# Main function to analyze security logs
analyze_logs() {
    # Use grep to search for suspicious patterns in the syslog
    suspicious_logs=$(grep -E 'error|warning|fail|critical' "$LOGFILE")

    # If suspicious activity is found, log it
    if [ -n "$suspicious_logs" ]; then
        log_vulnerability "$suspicious_logs"
    fi
}

# Main loop to continuously analyze logs
while true; do
    analyze_logs

    # Sleep for 5 minutes before analyzing logs again
    sleep 300
done

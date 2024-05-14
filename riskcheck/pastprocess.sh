#!/bin/bash

# Set the timeframe (in seconds) to look back (1 day = 86400 seconds)
TIMEFRAME=86400

# Get the current timestamp and the timestamp from 1 day ago
current_timestamp=$(date +%s)
start_timestamp=$((current_timestamp - TIMEFRAME))

# Extract killed processes from syslog within the specified timeframe
killed_processes=$(grep -E "$start_timestamp.*kill" /var/log/syslog)

# Display the extracted killed processes
echo "Killed Processes in the Last 24 Hours:"
echo "$killed_processes"


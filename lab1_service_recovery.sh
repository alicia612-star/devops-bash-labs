#!/bin/bash
# Production Server Recovery Automation
# Description: Checks if SSH is active. If down, attempts a restart and logs the status.

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_FILE="/var/log/nginx_recovery.log"

# Ensure the log file exists or fallback to the current directory if permission is denied
if [ ! -w "/var/log" ]; then
    LOG_FILE="./nginx_recovery.log"
fi

echo "[$TIMESTAMP] Running service health check..." >> "$LOG_FILE"

# Check if SSH is running
if systemctl is-active --quiet ssh; then
    echo "[$TIMESTAMP] SUCCESS: SSH is running smoothly." >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] WARNING: SSH is DOWN! Attempting emergency restart..." >> "$LOG_FILE"
    
    # Attempt to restart SSH
    sudo systemctl restart ssh
    
    # Verify the restart attempt
    if systemctl is-active --quiet ssh; then
        echo "[$TIMESTAMP] RECOVERY: SSH successfully restarted." >> "$LOG_FILE"
        echo "NOTIFICATION SENT: SSH recovered at $TIMESTAMP."
    else
        echo "[$TIMESTAMP] CRITICAL: SSH restart FAILED!" >> "$LOG_FILE"
        echo "CRITICAL ALERT: Manual intervention required immediately."
    fi
fi

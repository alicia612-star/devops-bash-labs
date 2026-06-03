#!/bin/bash
# AWS EC2 Monitoring Automation
# Description: Monitors Disk, Memory, and CPU utilization, saving outputs to a log directory.

LOG_DIR="/var/log/monitoring"
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")

# Create log directory if it doesn't exist (handles local fallback if not root)
if [ ! -d "$LOG_DIR" ]; then
    sudo mkdir -p "$LOG_DIR" 2>/dev/null || LOG_DIR="./monitoring"
    mkdir -p "$LOG_DIR"
fi

LOG_FILE="$LOG_DIR/system_metrics_$TIMESTAMP.log"

echo "=== System Monitoring Report - $TIMESTAMP ===" > "$LOG_FILE"

# 1. Monitor Disk Usage (Extracts the root partition usage percentage)
echo -e "\n[Disk Utilization]" >> "$LOG_FILE"
df -h / | awk 'NR==2 {print "Used space: " $5 " (Available: " $4 ")"}' >> "$LOG_FILE"

# 2. Monitor Memory Usage
echo -e "\n[Memory Utilization]" >> "$LOG_FILE"
free -m | awk 'NR==2 {printf "Used Memory: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3/$2*100}' >> "$LOG_FILE"

# 3. Monitor CPU Usage
echo -e "\n[CPU Utilization]" >> "$LOG_FILE"
# Grabs current idle percentage and subtracts from 100 to get consumption
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo "Current CPU Usage: $CPU_USAGE" >> "$LOG_FILE"

echo "=== End of Report ===" >> "$LOG_FILE"

echo "Metrics successfully saved to $LOG_FILE"

#!/usr/bin/env bash

# Create Logs folder if not exists
mkdir -p "$HOME/Logs"

# Create logs
logfile="$HOME/Logs/systrack-$(date +'%F-%H-%M-%S').log"
exec >> "$logfile" 2>&1

# Data
date=$(date +"%F %T")
cpu=$(echo "100 - $(top -bn1 | grep 'Cpu(s)' | awk '{print $8}' | sed 's/,/./')" | bc)
ram_used=$(free -m | grep "Mem:" | awk '{print $3}')
ram_free=$(free -m | grep "Mem:" | awk '{print $4}')
swap_used=$(free -m | grep "Swap:" | awk '{print $3}')
swap_free=$(free -m | grep "Swap:" | awk '{print $4}')
disc=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
who=$(who | wc -l)

# Csv file
file="$HOME/Logs/Stats/system_stats.csv"

# Create directory
mkdir -p "$HOME/Logs/Stats"

# file exists?
if [[ ! -f "$file" ]]; then
    echo "datetime,cpu_used_percent,ram_used_mb,ram_free_mb,swap_used_mb,swap_free_mb,disk_usage_percent,logged_users" > "$file"
fi

# Print data for file
echo "$date,$cpu,$ram_used,$ram_free,$swap_used,$swap_free,$disc,$who" >> "$file"
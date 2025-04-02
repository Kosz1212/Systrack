#!/usr/bin/env bash

# Collect system data
date=$(date +"%F %T")
cpu=$(echo "100 - $(top -bn1 | grep 'Cpu(s)' | awk '{print $8}' | sed 's/,/./')" | bc)
ram_used=$(free -m | grep "Mem:" | awk '{print $3}')
ram_free=$(free -m | grep "Mem:" | awk '{print $4}')
swap_used=$(free -m | grep "Swap:" | awk '{print $3}')
swap_free=$(free -m | grep "Swap:" | awk '{print $4}')
disc=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
who=$(who | wc -l)

# Define CSV file path
file="$HOME/Logs/Stats/system_stats.csv"

# Create directory for stats if it doesn't exist
mkdir -p "$HOME/Logs/Stats"

# Create CSV file with header if it doesn't exist
if [[ ! -f "$file" ]]; then
    echo "datetime,cpu_used_percent,ram_used_mb,ram_free_mb,swap_used_mb,swap_free_mb,disk_usage_percent,logged_users" > "$file"
fi

# Append data to the CSV file
echo "$date,$cpu,$ram_used,$ram_free,$swap_used,$swap_free,$disc,$who" >> "$file"

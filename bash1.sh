#!/bin/bash

# Get current time
current_time=$(date +%H:%M)

# Calculate target time for tomorrow (4:55 PM)
target_time="16:55"

# Check if current time is already past target time
if [[ "$current_time" > "$target_time" ]]; then
  # Need to wait until next day - calculate seconds until midnight
  seconds_to_midnight=$(( (23 - ${current_time%%:*}) * 3600 + (60 - ${current_time##*:}) ))
  # Add seconds needed to reach target time the next day
  total_sleep_seconds=$(( seconds_to_midnight + 16 * 3600 + 55 * 60 ))
else
  # Target time is today, calculate remaining seconds
  total_sleep_seconds=$(( (16 - ${current_time%%:*}) * 3600 + (55 - ${current_time##*:}) * 60 ))
fi

# Sleep for the calculated duration
echo "Sleeping until tomorrow 4:55 PM..."
sleep "$total_sleep_seconds"

echo "Woke up! It's $(date +%H:%M)"

#!/bin/bash

target_time="16:55"

total_sleep_seconds=$(( (16 - $(date +%H)) * 3600 + (55 - $(date +%M)) * 60 ))

[[ $(date +%H:%M) > "$target_time" ]] && total_sleep_seconds=$((total_sleep_seconds + 24*3600))

echo "Sleeping until tomorrow 4:55 PM..."
sleep "$total_sleep_seconds"

echo "Woke up! It's $(date +%H:%M)"

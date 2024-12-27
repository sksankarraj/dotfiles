#!/bin/bash

# This script is a simple way to clean up tmux sessions that are idle for 24 hours
#
# To use this script, add the following line to your crontab:
# 0 0 * * * /path/to/tmux-cleaner.sh

tmux list-sessions -F "#{session_name} #{session_activity}" | while read -r session last_activity; do

  current_epoch=$(date "+%s")
  idle_time=$((current_epoch - last_activity))

  if [ $idle_time -gt 86400 ]; then
    echo "Killing session $session with idle time $idle_time"
    tmux kill-session -t $session
  fi
done

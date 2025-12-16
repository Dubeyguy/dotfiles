#!/bin/bash

# Get current volume %
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\{1,3\}%' | head -1 | tr -d '%')

# Send notification with progress bar
notify-send -h int:value:"$VOL" \
            -h string:x-dunst-stack-tag:volume \
            "Volume"

#!/bin/bash

# This script adjusts the volume and sends a notification

# Adjust volume
case $1 in
up)
  # Unmute and increase volume by 5%
  pamixer -u
  pamixer -i 1
  ;;
down)
  # Unmute and decrease volume by 5%
  pamixer -u
  pamixer -d 1
  ;;
mute)
  # Toggle mute
  pamixer -t
  ;;
esac

# Get current volume and mute status
VOLUME=$(pamixer --get-volume)
MUTE_STATUS=$(pamixer --get-mute)

# Set notification icon and message
if [[ "$MUTE_STATUS" == "true" ]]; then
  ICON="audio-volume-muted"
  MESSAGE="Muted"
else
  if [ "$VOLUME" -gt 66 ]; then
    ICON="audio-volume-high"
  elif [ "$VOLUME" -gt 33 ]; then
    ICON="audio-volume-medium"
  else
    ICON="audio-volume-low"
  fi
  MESSAGE="Volume: ${VOLUME}%"
fi

# Old line (for comparison):
# notify-send -h int:value:"$VOLUME" -h string:x-canonical-private-synchronous:volume-osd -i "$ICON" "$MESSAGE"

# New line:
notify-send -a "volume-osd" -h int:value:"$VOLUME" -h string:x-canonical-private-synchronous:volume-osd -i "$ICON" "$MESSAGE"

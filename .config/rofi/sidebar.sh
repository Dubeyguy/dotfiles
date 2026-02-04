#!/bin/bash

# Get Media Info
PLAYER_STATUS=$(playerctl status 2>/dev/null)
if [ "$PLAYER_STATUS" = "Playing" ]; then
    MEDIA="󰏤 $(playerctl metadata title) - $(playerctl metadata artist)"
else
    MEDIA="󰐊 No Media Playing"
fi

# Get System Stats
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }')
BATT=$(cat /sys/class/power_supply/BAT0/capacity)

# Define the Options
options="Media: $MEDIA\nCPU: $CPU%\nRAM: $MEM\nBattery: $BATT%\n---\n󰒮 Previous\n󰐊 Play/Pause\n󰒭 Next\n󰚚 Refresh"

# Launch Rofi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "System Dashboard" -config ~/.config/rofi/sidebar.rasi)

# Handle Controls
case "$chosen" in
    *Previous*) playerctl previous ;;
    *Play/Pause*) playerctl play-pause ;;
    *Next*) playerctl next ;;
esac
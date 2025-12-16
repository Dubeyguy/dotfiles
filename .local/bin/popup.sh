#!/bin/bash

# Find the user's running Wayland display and D-Bus session
export WAYLAND_DISPLAY=$(ls /run/user/$(id -u)/wayland-*)
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

TITLE="$1"
MESSAGE="$2"

# Launch yad to create a dialog box
# --center: Center on screen
# --width=300: Set width
# --title: Set window title
# --text: Set main message
# --button: Define buttons (here, just an OK button)
yad --center --width=300 --title="$TITLE" --text="$MESSAGE" --button="OK:0"

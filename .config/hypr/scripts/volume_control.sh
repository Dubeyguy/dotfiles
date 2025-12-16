#!/bin/bash
action=$1
step=2
while true; do
    if [[ $action == "up" ]]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "+$step%"
    elif [[ $action == "down" ]]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "-$step%"
    fi
    sleep 0.1
done

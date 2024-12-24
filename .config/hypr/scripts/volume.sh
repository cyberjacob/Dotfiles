#!/bin/bash
pactl set-sink-volume @DEFAULT_SINK@ $1

pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1 > $XDG_RUNTIME_DIR/wob.sock

pacat ~/.local/share/Steam/steamui/sounds/deck_ui_volume.wav

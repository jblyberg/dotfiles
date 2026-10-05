#!/bin/bash
# Define the file to read
FILE="/tmp/hud_msg.txt"

# Check if the file exists before reading
if [ ! -f "$FILE" ]; then
  printf "  \uf130" >/tmp/hud_msg.txt
  exit 1
fi

# Read the content, stripping any trailing newlines or whitespace
CONTENT=$(tr -d '[:space:]' <"$FILE")

# Check the content against the specific Unicode characters (using lowercase \u)
if [ "$CONTENT" = $'\uf131' ]; then
  obs-cmd --websocket "obsws://localhost:4455/merepoint" audio unmute "Headset Microphone"
  printf "  \uf130" >/tmp/hud_msg.txt
elif [ "$CONTENT" = $'\uf130' ]; then
  obs-cmd --websocket "obsws://localhost:4455/merepoint" audio mute "Headset Microphone"
  printf "  \uf131" >/tmp/hud_msg.txt
else
  echo "The file contains something else."
fi

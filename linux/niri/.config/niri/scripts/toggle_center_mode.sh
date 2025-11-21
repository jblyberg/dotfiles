#!/bin/bash

CONFIG_FILE="$HOME/.config/niri/config.kdl"

if grep -q 'center-focused-column "always"' "$CONFIG_FILE"; then
  # If "always" is set, change to "never"
  sed -i 's/.*center-focused-column.*/    center-focused-column "never"/' "$CONFIG_FILE"
else
  # Otherwise, change to "always"
  sed -i 's/.*center-focused-column.*/    center-focused-column "always"/' "$CONFIG_FILE"
fi

# Reload the niri configuration to apply the changes
# niri msg action reload-config

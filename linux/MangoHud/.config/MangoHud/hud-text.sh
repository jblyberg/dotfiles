#!/bin/bash
# Read a custom message saved in a temporary text file
if [ -f /tmp/hud_msg.txt ]; then
  cat /tmp/hud_msg.txt
fi

#!/bin/bash
STATE_FILE="/tmp/ds4_state"
CURRENT_STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "OFF")

# Aggressively clean up existing instances
cleanup() {
  sudo pkill -9 ds4drv 2>/dev/null
  sleep 0.3
}

case "$CURRENT_STATE" in
"OFF")
  cleanup
  # State 2: Start Hidraw
  sudo setsid ds4drv --hidraw >/dev/null 2>&1 &
  echo "HIDRAW" >"$STATE_FILE"
  echo "HIDRAW"
  ;;
"HIDRAW")
  cleanup
  # State 3: Start Xpad Emulation
  sudo setsid ds4drv --hidraw --emulate-xpad >/dev/null 2>&1 &
  echo "XPAD" >"$STATE_FILE"
  echo "XPAD"
  ;;
*)
  cleanup
  # State 1: Turn Off
  echo "OFF" >"$STATE_FILE"
  echo "OFF"
  ;;
esac

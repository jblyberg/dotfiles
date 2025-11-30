#!/usr/bin/bash
# From https://www.reddit.com/r/wayland/comments/1b0y5tp/looking_for_a_screen_saver_in_wayland/

# init part

PID=""
ss_address=""
screen_saver=""
SCREEN_SAVERS_DIR=/usr/lib/xscreensaver
USR_RUN_DIR=/var/run/user/$(id -u)

if [ ! -r "$USR_RUN_DIR/my_screen_saver.pid" ]; then
  echo "" >"$USR_RUN_DIR"/my_screen_saver.pid
fi

# Functions

exec_screen_saver() {
  if [ -z "$(cat "$USR_RUN_DIR"/my_screen_saver.pid)" ]; then
    screen_saver=$(cat "$HOME"/scripts/screen_savers.list | shuf -n 1)
    $SCREEN_SAVERS_DIR/"$screen_saver" &
    PID=$!
    echo $PID >"$USR_RUN_DIR"/my_screen_saver.pid # to always have a pid to kill.
  fi
}

get_hypr_address() {
  local query=".[] | select(.pid == $1) | .address"
  sc_address=$(hyprctl clients -j | jq -r "$query")
}

# In a graphical session?

if [ -z "$DESKTOP_SESSION" ]; then
  echo "Not in Sway or Hyprland! nothing to do."
elif [ "$DESKTOP_SESSION" = "sway" ]; then
  exec_screen_saver
  sleep 1

  if [ -z "$screen_saver" ]; then
    echo ""
  else
    swaymsg -- \[instance="$screen_saver"\] fullscreen enable
  fi

elif [ "$DESKTOP_SESSION" = "hyprland" ]; then
  exec_screen_saver
  sleep 1
  if [ -z "$screen_saver" ]; then
    echo ""
  else
    get_hypr_address $PID
    hyprctl dispatch focuswindow "address:$sc_address"
    hyprctl dispatch fullscreen x
  fi

else
  echo "Not implemented yet..."
fi

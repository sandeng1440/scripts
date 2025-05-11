#!/usr/bin/env bash

# File to store the current color temperature
TEMP_FILE="$HOME/.config/hypr/color_temp"

# Default color temperature if file doesn't exist
DEFAULT_TEMP=6500
MIN_TEMP=1000
MAX_TEMP=10000
STEP=500 # Increment/decrement step size

# Read current temperature or use default
if [[ -f "$TEMP_FILE" ]]; then
  CURRENT_TEMP=$(cat "$TEMP_FILE")
else
  CURRENT_TEMP=$DEFAULT_TEMP
fi

# Function to update wlsunset with new temperature
update_wlsunset() {
  # Kill any existing wlsunset process
  pkill wlsunset
  # Start wlsunset with the new temperature
  wlsunset -T "$1" &
  # Save the new temperature
  echo "$1" >"$TEMP_FILE"
}

# Check argument
case "$1" in
"inc")
  NEW_TEMP=$((CURRENT_TEMP + STEP))
  if [[ $NEW_TEMP -le $MAX_TEMP ]]; then
    update_wlsunset $NEW_TEMP
  else
    update_wlsunset $MAX_TEMP
  fi
  ;;
"dec")
  NEW_TEMP=$((CURRENT_TEMP - STEP))
  if [[ $NEW_TEMP -ge $MIN_TEMP ]]; then
    update_wlsunset $NEW_TEMP
  else
    update_wlsunset $MIN_TEMP
  fi
  ;;
*)
  echo "Usage: $0 {inc|dec}"
  exit 1
  ;;
esac

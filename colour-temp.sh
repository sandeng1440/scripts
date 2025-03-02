#!/usr/bin/env bash

# Script to adjust the temperature of gammastep

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 [warmer|cooler]"
  exit 1
fi

# Get the current temperature
current_temp=$(gammastep -p | grep "Color temperature" | awk '{print $4}' | sed 's/K//')

# Check if the current temperature is a valid number
if ! [[ "$current_temp" =~ ^[0-9]+$ ]]; then
  echo "Error: Could not determine current temperature."
  exit 1
fi

# Set the temperature adjustment step
step=500

# Adjust the temperature based on the argument
case "$1" in
  "warmer")
    new_temp=$((current_temp - step))
    ;;
  "cooler")
    new_temp=$((current_temp + step))
    ;;
  *)
    echo "Error: Invalid argument. Use 'warmer' or 'cooler'."
    exit 1
    ;;
esac

# Ensure the new temperature is within a reasonable range (adjust as needed)
if [ "$new_temp" -lt 1000 ]; then
  new_temp=1000
elif [ "$new_temp" -gt 20000 ]; then
  new_temp=20000
fi

# Apply the new temperature
gammastep -O -P $new_temp

echo "Temperature adjusted to $new_temp K"

exit 0

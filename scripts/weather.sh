#!/bin/bash

# Fetch weather data for Mettmann
weather=$(curl -s 'wttr.in/Mettmann?format=2')
echo -e "$weather"

# # Split condition and temperature
# condition=$(echo "$weather" | cut -d'+' -f1)
# temp=$(echo "$weather" | cut -d'+' -f2)
#
# # Map condition to emoji
# case "$condition" in
# "Sunny") icon="\U00002600" ;;                                          # ☀️
# "Partly cloudy") icon="\U000026C5" ;;                                  # ⛅
# "Cloudy" | "Overcast") icon="\U00002601" ;;                            # ☁️
# "Rain" | "Light rain" | "Heavy rain" | "Showers") icon="\U0001F327" ;; # 🌧️
# "Snow" | "Light snow" | "Heavy snow") icon="\U00002744" ;;             # ❄️
# "Fog" | "Mist") icon="\U0001F32B" ;;                                   # 🌫️
# *) icon="\U000026C5" ;;                                                # Default to partly cloudy for unknown conditions
# esac
#
# # Output emoji and temperature
# echo -e "$icon $temp"

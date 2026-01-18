#!/bin/sh
# dwmblocks sunrise/sunset exact time

# Coordinates
LAT="38.7071"
LON="-9.1359"

# Fetch data
data=$(curl -s --connect-timeout 8 "https://api.sunrise-sunset.org/json?lat=${LAT}&lng=${LON}&formatted=0")

if [ -z "$data" ] || echo "$data" | grep -q "INVALID_REQUEST"; then
    echo "󰖜/󰖛 err"
    exit 1
fi

# Extract UTC ISO times (up to the + sign for timezone offset)
sunrise_utc=$(echo "$data" | grep -oP '(?<="sunrise":").*?(?=\+)')
sunset_utc=$(echo "$data" | grep -oP '(?<="sunset":").*?(?=\+)')

# Convert to local Lisbon time (WET = UTC in winter; WEST = UTC+1 in summer)
# GNU date handles the offset automatically from the ISO string
sunrise=$(date -d "${sunrise_utc}" +%H:%M 2>/dev/null)
sunset=$(date -d "${sunset_utc}" +%H:%M 2>/dev/null)

if [ -z "$sunrise" ] || [ -z "$sunset" ]; then
    echo "󰖜/󰖛 err  "
    exit 1
fi

# Output with your icons (you can add colors via ^c#hex^ if your dwmblocks supports pango/escape codes)
echo " ${sunrise}  ${sunset}"

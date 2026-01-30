#!/bin/sh

# Coordinates
LAT="38.7071"
LON="-9.1359"

data=$(curl -s --connect-timeout 8 "https://api.sunrise-sunset.org/json?lat=${LAT}&lng=${LON}&formatted=0")

if [ -z "$data" ] || echo "$data" | grep -q "INVALID_REQUEST"; then
    echo "󰖜/󰖛 err 󱚵"
    exit 1
fi

sunrise_utc=$(echo "$data" | grep -oP '(?<="sunrise":").*?(?=\+)')
sunset_utc=$(echo "$data" | grep -oP '(?<="sunset":").*?(?=\+)')

sunrise=$(date -d "${sunrise_utc}" +%H:%M 2>/dev/null)
sunset=$(date -d "${sunset_utc}" +%H:%M 2>/dev/null)

if [ -z "$sunrise" ] || [ -z "$sunset" ]; then
    echo "󰖜/󰖛 err"
    exit 1
fi

echo " ${sunrise}   ${sunset}"

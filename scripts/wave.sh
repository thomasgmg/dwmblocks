#!/bin/bash

API_KEY="dd4ef94a-f877-11f0-9ff8-0242ac120004-dd4ef9d6-f877-11f0-9ff8-0242ac120004"

LAT="39.134"
LNG="-9.384"

data=$(curl -s "https://api.stormglass.io/v2/weather/point?lat=${LAT}&lng=${LNG}&params=waveHeight,wavePeriod&source=sg" \
    -H "Authorization: ${API_KEY}")

if [ $? -ne 0 ] || [ -z "$data" ]; then
    echo "?"
    exit 1
fi

height_raw=$(echo "$data" | jq -r '.hours[0].waveHeight.value // ""')
period_raw=$(echo "$data" | jq -r '.hours[0].wavePeriod.value // ""')

if [ -z "$height_raw" ] || [ -z "$period_raw" ]; then
    echo "?"
    exit 1
fi

# Round only if numeric (basic check)
if echo "$height_raw" | grep -qE '^[0-9]+(\.[0-9]+)?$'; then
    height=$(printf "%.1f" "$height_raw" 2>/dev/null)
else
    height="?"
fi

period="$period_raw"

echo "${height}m ${period}s"

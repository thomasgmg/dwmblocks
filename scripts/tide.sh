#!/bin/sh

data=$(curl -s --connect-timeout 8 "https://www.tide-forecast.com/locations/Peniche-Portugal/tides/latest")

if [ -z "$data" ]; then
    echo "err 󱚵"
    exit 1
fi

raw_times=$(echo "$data" | grep -A 10 -i 'predicted tide times.*today' | \
            grep -oE '[0-9]?[0-9]:[0-9][0-9](am|pm|AM|PM)' | head -n 4)

if [ -z "$raw_times" ] || [ "$(echo "$raw_times" | wc -l)" -lt 4 ]; then
    echo "tide err"
    exit 1
fi

clean_times=$(echo "$raw_times" | \
    sed 's/^\([1-9]\):\([0-9][0-9]\)\([ap]m\)$/0\1:\2\3/i' | \
    awk '{
        time = $0;
        match(time, /[0-9][0-9]:[0-9][0-9]/);
        hm = substr(time, RSTART, RLENGTH);
        period = tolower(substr(time, RSTART+RLENGTH));
        split(hm, t, ":");
        h = t[1] + 0;
        m = t[2] + 0;
        if (period ~ /pm/ && h < 12) h += 12;
        if (period ~ /am/ && h == 12) h = 0;
        printf "%02d:%02d ", h, m;
    }')

if [ -z "$clean_times" ]; then
    echo "tide err"
    exit 1
fi

echo "$clean_times" | awk '{
    printf "%s↓ %s↑ %s↓ %s↑\n", $1, $2, $3, $4
}'

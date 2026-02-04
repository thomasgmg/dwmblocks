#!/bin/bash

data=$(curl -s --connect-timeout 12 "https://www.tide-forecast.com/locations/Peniche-Portugal/tides/latest")

[ -z "$data" ] && { echo "err 󱚵"; exit 1; }

tide_block=$(echo "$data" | sed -n '/predicted tide times.*today/,$p' | sed '/tomorrow/q' | head -n 100)

[ -z "$tide_block" ] && { echo "tide err"; exit 1; }

first_is_high=1
if echo "$tide_block" | grep -qi "first high tide at"; then
    first_is_high=1
elif echo "$tide_block" | grep -qi "first low tide at"; then
    first_is_high=0
fi

raw_times=$(echo "$tide_block" |
    grep -oE '[0-9]{1,2}:[0-9]{2}[ap]m' | head -n 4)

[ "$(echo "$raw_times" | wc -l)" -ne 4 ] && { echo "times err"; exit 1; }

# ───────────────────────────────────────────────
# Better 12h → 24h conversion – more robust
# ───────────────────────────────────────────────
clean_times=$(echo "$raw_times" | awk '
    function pad(n) { return sprintf("%02d", n) }
    {
        time = $0
        if (match(time, /^[0-9]{1,2}:[0-9]{2}/)) {
            hm = substr(time, RSTART, RLENGTH)
            period = tolower(substr(time, RSTART + RLENGTH))
            
            split(hm, t, ":")
            h = t[1] + 0
            m = t[2] + 0
            
            if (period ~ /^pm$/ && h < 12) h += 12
            if (period ~ /^am$/ && h == 12) h = 0
            
            print pad(h) ":" pad(m)
        }
    }')

[ "$(echo "$clean_times" | wc -l)" -ne 4 ] && { echo "clean err"; exit 1; }

# ───────────────────────────────────────────────
# Output
# ───────────────────────────────────────────────
if [ "$first_is_high" = 1 ]; then
    symbols="↑ ↓ ↑ ↓"
else
    symbols="↓ ↑ ↓ ↑"
fi

times=$(echo "$clean_times" | tr '\n' ' ')
set -- $times

printf '%s%s %s%s %s%s %s%s\n' \
    "$1" "$(echo "$symbols" | cut -d' ' -f1)" \
    "$2" "$(echo "$symbols" | cut -d' ' -f2)" \
    "$3" "$(echo "$symbols" | cut -d' ' -f3)" \
    "$4" "$(echo "$symbols" | cut -d' ' -f4)"

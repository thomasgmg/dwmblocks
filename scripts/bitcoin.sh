#!/bin/bash

printf " %s€" "$(curl -sf "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=eur" 2>/dev/null \
                 | jq -r '.bitcoin.eur // "0"' \
                 | cut -f1 -d. \
                 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')" || printf " --"


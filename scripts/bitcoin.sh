#!/bin/bash

if ! price=$(curl -sSf "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=eur" 2>/dev/null | jq -r '.bitcoin.eur // "0"'); then
    printf "err 󱚵 "
    exit 0
fi

# Format integer part with European thousand separators (dots)
formatted=$(printf "%.0f" "$price" | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')

printf "%s" "$formatted"

#!/bin/bash

weather=$(curl -s 'wttr.in/Silveira?format=2' | tr -d '+' | tr -d ' ' | sed 's/🌬️/   /' | sed 's/☀️/  /' | sed 's/⛅️/  /' | sed 's/🌦/  /' | sed 's/☁️/  /' | sed 's/🌫/  /' | sed 's/🌩/󰖓  /' | sed 's/🌧/  /')

# if [ -z "$weather" ] || [ "$(echo "$weather" | wc -l)" -lt 4 ]; then
#     echo " err 󱚵"
#     exit 1
#
# fi

echo "$weather"

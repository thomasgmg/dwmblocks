#!/bin/bash

weather=$(curl -s 'wttr.in/Silveira?format=2' | tr -d '+' | tr -d ' ' | sed 's/🌬️/ /' | sed 's/☀️/ /' | sed 's/⛅️/ /' | sed 's/🌦/ /' | sed 's/☁️/ /' | sed 's/🌫/ /' | sed 's/🌩/󰖓 /' | sed 's/🌧/ /')
echo -e "$weather"

#!/bin/bash

weather=$(curl -s 'wttr.in/Penafirme?format=1' | tr -d '+' | tr -d ' ' | sed 's/☀️/  /' | sed 's/⛅️/  /' | sed 's/🌦  /  /' | sed 's/☁️/  /')
echo -e "$weather"

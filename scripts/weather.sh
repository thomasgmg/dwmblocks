#!/bin/bash

weather=$(curl -s 'wttr.in/Penafirme?format=3' | tr -d '+' | tr -d ' ' | sed 's/☀️/  /' | sed 's/⛅️/  /' | sed 's/🌦  /  /' | sed 's/☁️/  /')
echo -e "$weather"

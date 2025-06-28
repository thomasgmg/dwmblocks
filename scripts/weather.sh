#!/bin/bash

# Fetch weather data for Mettmann
# weather=$(curl -s 'wttr.in/Mettmann?format=2' | tr -d ' ' | tr -d '+' | tr -d '🌬️ ')
# weather=$(curl -s 'wttr.in/Mettmann?format=2' | tr -d ' ' | tr -d '+' | sed 's/🌬️//')
weather=$(curl -s 'wttr.in/Mettmann?format=2' | tr -d ' ' | tr -d '+' | sed 's/🌬️/   /' | sed 's/→//')
echo -e "$weather"

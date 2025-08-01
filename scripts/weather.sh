#!/bin/bash

# Fetch weather data for Mettmann
weather=$(curl -s 'wttr.in/Silveira?format=2' | tr -d ' ' | tr -d '+' | sed 's/🌬️/   /')
echo -e "$weather"

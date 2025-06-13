#!/bin/bash

# Fetch weather data for Mettmann
weather=$(curl -s 'wttr.in/Mettmann?format=2' | tr -d ' ')
echo -e "$weather"

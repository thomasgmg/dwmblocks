#!/bin/sh

week=$(date '+%V')
if [ $((week % 2)) -eq 0 ]; then
    echo "Par ($week)"
else
    echo "Impar ($week)"
fi

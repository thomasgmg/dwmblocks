#!/bin/bash

awk '{cap=$1; print (cap<25?"󰂎 ":cap<50?"󱊡 ":cap<75?"󱊢 ":"󱊣 ") cap"%"}' /sys/class/power_supply/BAT0/capacity

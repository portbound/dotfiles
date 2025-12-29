#!/bin/bash

pow_percent=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

pow_int="${pow_percent%?}"

FULL="󰁹"
EXCELLENT="󰂂"
GREAT="󰂁"
GOOD="󰂀"
OK="󰁿"
FAIR="󰁾"
LOW="󰁽"
WARNING="󰁼"
BAD="󰁻"
EMPTY="󰁺"

if (( pow_int == 100)); then echo "$FULL $pow_int" 
elif (( pow_int >= 90)); then echo "$EXCELLENT $pow_int"
elif (( pow_int >= 80)); then echo "$GREAT $pow_int"
elif (( pow_int >= 70)); then echo "$GOOD $pow_int"
elif (( pow_int >= 60)); then echo "$OK $pow_int"
elif (( pow_int >= 50)); then echo "$FAIR $pow_int"
elif (( pow_int >= 40)); then echo "$LOW $pow_int"
elif (( pow_int >= 30)); then echo "$WARNING $p"
elif (( pow_int >= 20)); then echo "$BAD $pow_int"
else (( pow_int >= 10)); echo "$EMPTY $pow_int"
fi

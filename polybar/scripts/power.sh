#!/bin/sh
PATH_AC="/sys/class/power_supply/AC0"
PATH_BATTERY_0="/sys/class/power_supply/BAT0"

ac=0
battery_level_0=0
battery_max_0=0

if [ -f "$PATH_AC/online" ]; then
    ac=$(cat "$PATH_AC/online")
 
fi

if [ -f "$PATH_BATTERY_0/charge_now" ]; then
    battery_level_0=$(cat "$PATH_BATTERY_0/charge_now")
    
fi

if [ -f "$PATH_BATTERY_0/charge_full" ]; then
    battery_max_0=$(cat "$PATH_BATTERY_0/charge_full")
    
fi

battery_percent=$(($battery_level_0 * 10000))
battery_percent=$(($battery_percent / $battery_max_0 / 98 ))


if [ "$ac" -eq 1 ]; then
	
    if [ "$battery_percent" -gt 100 ]; then
        icon="󰂅"
    elif [ "$battery_percent" -gt 90 ]; then
        icon="󰂋"
    elif [ "$battery_percent" -gt 80 ]; then
        icon="󰂊"
    elif [ "$battery_percent" -gt 70 ]; then
        icon="󰢞"
    elif [ "$battery_percent" -gt 60 ]; then
        icon="󰂉"
    elif [ "$battery_percent" -gt 50 ]; then
        icon="󰢝"
    elif [ "$battery_percent" -gt 40 ]; then
        icon="󰂈"
    elif [ "$battery_percent" -gt 30 ]; then
        icon="󰂇"
    elif [ "$battery_percent" -gt 20 ]; then
        icon="󰂆"
    elif [ "$battery_percent" -gt 10 ]; then
	icon="󰢜"
    else
        icon="󰂃"
    fi
	   echo "$icon $battery_percent %"

else
    if [ "$battery_percent" -gt 95 ]; then
        icon="󰁹"
    elif [ "$battery_percent" -gt 90 ]; then
        icon="󰂂"
    elif [ "$battery_percent" -gt 80 ]; then
        icon="󰂁"
    elif [ "$battery_percent" -gt 70 ]; then
        icon="󰂀"
    elif [ "$battery_percent" -gt 60 ]; then
        icon="󰁿"
    elif [ "$battery_percent" -gt 50 ]; then
        icon="󰁾"
    elif [ "$battery_percent" -gt 40 ]; then
        icon="󰁽"
    elif [ "$battery_percent" -gt 30 ]; then
        icon="󰁼"
    elif [ "$battery_percent" -gt 20 ]; then
        icon="󰁻"
    elif [ "$battery_percent" -gt 10 ]; then
	icon="󰁺"
    else
        icon="󰂃"
    fi

   echo "$icon $battery_percent %"
fi

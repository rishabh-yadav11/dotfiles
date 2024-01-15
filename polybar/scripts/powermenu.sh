#!/usr/bin/env bash


dir="~/.config/polybar/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -no-config -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend="⏾ Sleep"
logout="󰍃 Logout"


options=" $lock \n $suspend \n $logout \n$reboot \n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)		
			systemctl poweroff	
        ;;
    $reboot)
			systemctl reboot	
        ;;
    $lock)
			i3lock-fancy
        ;;
    $suspend)
			systemctl suspend	
        ;;
    $logout)
			i3-msg exit
        ;;
esac

#!/bin/sh

# Use brillo to logarithmically adjust laptop screen brightness
# and send a notification displaying the current brightness level after.

send_notification() {
	brightness=$(brightnessctl | awk -F '[()]' '/Current brightness/{print $2}')
	dunstify -a "changebrightness" -u low -r 9993 -h int:value:"$brightness" -i "brightness" "Brightness" "Currently at $brightness" -t 2000
}
	
case $1 in
up)
	brightnessctl set +4
	send_notification "$1"
	;;
down)
  brightnessctl set 4-
	send_notification "$1"
	;;
esac

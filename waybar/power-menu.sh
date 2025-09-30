#!/bin/sh

entries="⏻ Power Off
󰔈  Hibernate
  Restart
⏾ Suspend"
chosen=$(echo -e "$entries" | wofi --dmenu -i --prompt "Power Menu")

case "$chosen" in
	"⏻ Power Off")
		systemctl poweroff ;;
	"󰔈  Hibernate")
		systemctl hibernate ;;
	"  Restart")
		systemctl reboot ;;
	"⏾ Suspend")
		systemctl suspend ;;
	*)
		exit 1 ;;
esac

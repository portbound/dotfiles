#!/bin/bash

wifi_status=$(nmcli device status |awk '$2 == "wifi"' |awk '{print $3}')
ethernet_status=$(nmcli device status |awk '$2 == "ethernet"' |awk '{print $3}')
essid=$( nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

WIFI_ICON=""
ETHERNET_ICON="󰈀"
DISCONNECTED_ICON="⚠"


if [ "${wifi_status}" = "connected" ]; then echo [ "$WIFI_ICON  ${essid} ]"
elif [ "${ethernet_status}" = "connected" ]; then echo "$ETHERNET_ICON"
else echo "$DISCONNECTED_ICON disconnected"
fi

#!/bin/bash

wifi_status=$(nmcli device status |awk '$2 == "wifi"' |awk '{print $3}')
ethernet_status=$(nmcli device status |awk '$2 == "ethernet"' |awk '{print $3}')

WIFI_ICON=""
ETHERNET_ICON="󰈀"
DISCONNECTED_ICON="⚠"


if [ "${wifi_status}" = "connected" ]; then echo "$WIFI_ICON  connected"
elif [ "${ethernet_status}" = "connected" ]; then echo "$ETHERNET_ICON connected"
else echo "$DISCONNECTED_ICON disconnected"
fi

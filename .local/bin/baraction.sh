#!/bin/bash

while :; do
				NETSTAT="$(nmcli -p | grep wlp1s0 | head -1 | awk '{ print $2 }')"
				NETNAME="$(if [ $NETSTAT == "connected" ]; then echo "$(nmcli -p | grep wlp1s0 | head -1 | awk '{ print $4 }')"; else echo ""; fi)"

				VOLUME="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)%"
				
				TODAY="$(date "+%d %B, %H:%M")"

				BATTERY="$(echo -e "$(cat /sys/class/power_supply/BAT*/capacity)"%)"

				echo "${NETNAME}    Battery: ${BATTERY}    Volume: ${VOLUME}    Date: ${TODAY}"
				sleep 1
done

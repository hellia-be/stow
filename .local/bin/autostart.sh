#!/bin/bash

/home/mediaserv/.screenlayout/default.sh &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
nitrogen --restore &
dunst -c /home/mediaserv/.config/dunst/dunstrc &

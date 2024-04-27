#!/bin/bash

. $HOME/.config/dmenu/.dmenurc
DMENU="dmenu $DMENU_OPTIONS"
choice=$(echo -e "PC\nPlayStation 2\nGameBoy\nNintendo DS" | $DMENU)

case "$choice" in
				"PC") steam & ;;
				"PlayStation 2") pcsx2-qt & ;;
				"GameBoy") mgba-qt & ;;
				"Nintendo DS") desmume & ;;
esac

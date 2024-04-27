#!/bin/sh

screenshot() {
				case $1 in
								full) scrot -m -e 'mv $f /home/mediaserv/Pictures/Screenshots/' ;;
								window) sleep 1; scrot -s -e 'mv $f /home/mediaserv/Pictures/Screenshots/' ;;
								*) ;;
				esac
}

screenshot $1

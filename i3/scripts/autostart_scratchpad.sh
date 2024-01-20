#!/bin/sh
if ! pgrep -f "alacritty --class ttrm"; then alacritty --class ttrm & disown; fi

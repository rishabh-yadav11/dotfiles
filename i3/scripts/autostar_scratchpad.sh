#!/bin/sh
if ! pgrep -f "alacritty --class ttrm.ttrm"; then alacritty --class ttrm.ttrm & disown; fi

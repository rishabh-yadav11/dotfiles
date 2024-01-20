#!/bin/sh
if ! pgrep -f "kitty --class ttrm"; then kitty --class ttrm & disown; fi

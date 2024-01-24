#!/bin/sh
if ! pgrep -f "kitty --hold --class ttrm"; then kitty --hold --class ttrm & disown; fi

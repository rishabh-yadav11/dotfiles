#!/bin/sh
if ! pgrep -f "terminator --role ttrm"; then terminator --role ttrm & disown; fi

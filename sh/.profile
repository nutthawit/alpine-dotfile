#!/bin/ash

export ENV="$HOME/.ashrc"

# Autostart sway when login tty 1
if [ "$(tty)" = "/dev/tty1" ]; then
     run-sway -d 2> ~/sway.log
fi

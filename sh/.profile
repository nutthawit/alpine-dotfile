#!/bin/bash

export ENV="$HOME/.bashrc"

# Autostart sway when login tty 1
if [ "$(tty)" = "/dev/tty1" ]; then
     run-sway -d 2> ~/sway.log
fi

#if [ "$(tty)" = "/dev/tty2" ]; then
#     start-cosmic | tee ~/cosmic.log
#fi

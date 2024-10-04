#!/usr/bin/env bash

echo "Start"

SESSION=HiddenSession

tmux -2 -L $SESSION new-session -d -s System -n calc

tmux -L $SESSION send-keys "python3 -q" C-m
tmux -L $SESSION send-keys "from math import sqrt, pi, sin, cos, tan, asin, acos, atan" C-m
tmux -L $SESSION send-keys "d2r=pi/180" C-m

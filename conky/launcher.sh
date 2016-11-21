#!/bin/bash

INSERT_PATH=./

conky -dq -c $INSERT_PATH/time_rc
conky -dq -c $INSERT_PATH/system_rc
conky -dq -c $INSERT_PATH/processes_rc
conky -dq -c $INSERT_PATH/memory_rc
conky -dq -c $INSERT_PATH/filesystem_rc
conky -dq -c $INSERT_PATH/network_rc
conky -dq -c $INSERT_PATH/fortune_rc

width_of_primary_monitor=$(xrandr | grep primary | grep -o "[0-9]\+x[0-9]\+" | grep -o "^[0-9]\+")
calendar=calendar_rc_$width_of_primary_monitor
conky -dq -c $INSERT_PATH/$calendar

#conky -dq -c $INSERT_PATH/mediaplayer_rc

#!/bin/bash

INSERT_PATH=./
MACHINE_NAME=$(hostname)

function launcher()
{
    if [ -f $INSERT_PATH/$1_$MACHINE_NAME ]
    then
        conky -dq -c $INSERT_PATH/$1_$MACHINE_NAME
    else
        conky -dq -c $INSERT_PATH/$1
    fi
}

#launcher time_rc

launcher system_rc
launcher memory_rc
launcher fortune_rc

launcher calendar_rc
launcher processes_rc
launcher filesystem_rc
launcher network_rc

#launcher mediaplayer_rc


#!/bin/bash

sleep 10
INSERT_PATH=/home/camza/work/lite_x/tests_conky/my_conky

conky -dq -c $INSERT_PATH/time_rc
conky -dq -c $INSERT_PATH/system_rc
conky -dq -c $INSERT_PATH/processes_rc
conky -dq -c $INSERT_PATH/memory_rc
conky -dq -c $INSERT_PATH/filesystem_rc
conky -dq -c $INSERT_PATH/network_rc
conky -dq -c $INSERT_PATH/fortune_rc
#conky -dq -c $INSERT_PATH/mediaplayer_rc

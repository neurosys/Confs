#!/usr/bin/env bash

nr_of_monitors=$(xrandr | grep connected | wc -l)

if [[ $nr_of_monitors -eq 2 ]]
then
    polybar -c ~/.myconfig/xorg/polybar_home.conf mon1 &
    polybar -c ~/.myconfig/xorg/polybar_home.conf mon2 &
fi

if [[ $nr_of_monitors -eq 3 ]]
then
    polybar -c ~/.myconfig/xorg/polybar_work.conf mon1 &
    polybar -c ~/.myconfig/xorg/polybar_work.conf mon2 &
    #polybar -c ~/.myconfig/xorg/polybar_work.conf mon3 &
fi

if [[ $nr_of_monitors -eq 1 ]]
then
    polybar -c ~/.myconfig/xorg/polybar_home.conf mon1 &
fi

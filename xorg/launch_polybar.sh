#!/usr/bin/env bash

nr_of_monitors=$(xrandr | grep "\<connected\>" | wc -l)

if [[ $nr_of_monitors -eq 2 ]]
then
    polybar -c ~/.myconfig/xorg/polybar.d/polybar_dormammu.txt mon1 &
    polybar -c ~/.myconfig/xorg/polybar.d/polybar_dormammu.txt mon2 &
fi

if [[ $nr_of_monitors -eq 3 ]]
then
    polybar -c ~/.myconfig/xorg/polybar.d/polybar_camza-pc.txt mon1 &
    polybar -c ~/.myconfig/xorg/polybar.d/polybar_camza-pc.txt mon2 &
    polybar -c ~/.myconfig/xorg/polybar.d/polybar_camza-pc.txt mon3 &
fi

if [[ $nr_of_monitors -eq 1 ]]
then
    polybar -c ~/.myconfig/xorg/polybar.d/polybar_dementor.txt mon1 &
fi

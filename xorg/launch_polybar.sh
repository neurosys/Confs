#!/usr/bin/env bash

function launchPolybar() 
{
    hostname=$1
    nrMonitors=$2
    for i in $(seq 1 $nrMonitors)
    do
        polybar -c ~/.myconfig/xorg/polybar.d/polybar_${hostname}.txt "mon${i}" &
    done
}

nr_of_monitors=$(xrandr | grep "\<connected\>" | wc -l)

launchPolybar $(hostname) $nr_of_monitors


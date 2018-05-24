#!/bin/bash

INSERT_PATH=./
MACHINE_NAME=$(hostname)

function get_screen_width()
{
    # Samples:
    # Screen 0: minimum 8 x 8, current 1920 x 1080, maximum 16384 x 16384
    xrandr | grep -o " current [0-9]\+ x [0-9]\+" | sed -e 's/ current \([0-9]\+\) .*/\1/'
}

function launcher()
{
    echo "launcher() $1"
    if [ -f $INSERT_PATH/$MACHINE_NAME/$1 ]
    then
        conky -dq -c $INSERT_PATH/$MACHINE_NAME/$1
    else
        conky -dq -c $INSERT_PATH/default/$1
    fi
}

screen_width=$(get_screen_width)

case $screen_width in
    "1920")
        echo "Bibi"
        #conky -a tr -x 60 -dq -c calendar_rc_dormammu
        conky -a tr -x 60 -dq -c calendar_rc
        ;;
    "3840")
        conky -a tr -x 60 -dq -c calendar_rc
        ;;
esac



#exit 0
#launcher time_rc

launcher system_rc
launcher memory_rc
launcher fortune_rc

launcher calendar_rc
launcher processes_rc
launcher filesystem_rc
launcher network_rc

#launcher mediaplayer_rc

##conky 1.10.5_pre compiled Sat Oct  8 06:45:53 UTC 2016 for Linux 4.7.6-1-ARCH x86_64
##
##Compiled in features:
##
##System config file: /etc/conky/conky.conf
##Package library path: /usr/lib/conky
##
##
## General:
##  * math
##  * hddtemp
##  * portmon
##  * IPv6
##  * Curl
##  * RSS
##  * Weather (METAR)
##  * Weather (XOAP)
##  * wireless
##  * support for IBM/Lenovo notebooks
##  * builtin default configuration
##  * old configuration syntax
##  * Imlib2
##  * apcupsd
##  * iostats
##  * ncurses
##  * Internationalization support
##  * PulseAudio
## X11:
##  * Xdamage extension
##  * Xinerama extension (virtual display)
##  * XDBE (double buffer extension)
##  * Xft
##  * ARGB visual
##  * Own window
##
## Music detection:
##  * MPD
##  * MOC
##
## Default values:
##  * Netdevice: eth0
##  * Local configfile: $HOME/.conkyrc
##  * Localedir: /usr/share/locale
##  * Maximum netdevices: 64
##  * Maximum text size: 16384
##  * Size text buffer: 256

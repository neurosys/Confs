#!/bin/bash

#nohup pavucontrol &
#nohup vlc &
#cd

#nohup barM 2>&1 > /dev/null &
nohup barM &> /dev/null &

usr=$(whoami)
if [ -f /home/$usr/.myconfig/conky/launcher.sh ]
then
    cd /home/$usr/.myconfig/conky
    ./launcher.sh
    cd -
fi


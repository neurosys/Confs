#!/usr/bin/env bash

# kanata-setup.sh <user>
#
# This script is an automation of the guide found at (version atm is 1.10.2):
#   https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md
#   

if [[ $# -ne 1 ]]
then
    echo "Err: No user provided"
    echo -e "\tsudo kanata-setup.sh <username>"
    exit 0
fi

if [[ $UID -ne 0 ]]
then
    echo "This script must be run as root"
    exit 0
fi

user=neurosys
groups=$(cat /etc/group)
uinputGid=$(echo "$groups" | awk -F: '/^uinput:/{print $3}')

SYS_GID_MAX=999
SYS_GID_MIN=100
if [[ ! -f /etc/login.defs ]]
then
    echo "WARN: /etc/login.defs not found. Script is trying to determine SYS_GID_MAX and SYS_GID_MIN, will use default values instead."
else
    source <(cat /etc/login.defs | grep -v "#.*" | grep "GID" | sed -e 's/[ \t]\+/=/')

    # In case we're somehow on a platform that has GID_MIN set below 1000, and SYS_GID_MAX is not set
    if [[ $SYS_GID_MAX -gt $GID_MIN ]]
    then
        SYS_GID_MAX=$((GID_MIN - 1))
        SYS_GID_MIN=$((SYS_GYD_MAX - 100))
    fi
fi

if [[ "$uinputGid" == "" ]]
then
    echo "Group 'uinput' not found, adding..."
    sudo groupadd --system uinput
else
    echo "Group 'uinput' found"
    echo "Checking that group 'uinput' is a system group..."
    if [[ $uinputGid -ge $SYS_GID_MAX || $uinputGid -le $SYS_GID_MIN ]]
    then
        echo "Group 'uinput' is not a system group... re-creating"
        sudo groupdel uinput
        sudo groupadd --system uinput
    fi
fi

echo "$groups" | awk -F: '/^uinput:/{print $4}' | grep -q "$user"
if [[ $? -ne 0 ]]
then
    echo "User not member of group 'uinput', adding..."
    echo -e "\tTo run the kanata from this shell without login run 'newgrp uinput' to login into the new group"
    usermod -aG uinput $user
fi


echo "$groups" | awk -F: '/^input:/{print $4}' | grep -q "$user"
if [[ $? -ne 0 ]]
then
    echo "User not member of group 'input', adding..."
    echo -e "\tTo run the kanata from this shell without login run 'newgrp input' to login into the new group"
    usermod -aG input $user
fi

sudo modprobe uinput

if [[ ! -e /dev/uinput ]]
then
    echo "ERR: /dev/uinput is missing (most probably 'modprobe uinput' failed)"
    exit 1
fi

# 
if [[ ! -d /etc/udev || ! -d /etc/udev/rules.d ]]
then
    echo "ERR: missing /etc/udev, /etc/udev/rules.d or udev simply not installed"
    exit 1
fi

udevIdx=9
while true
do
    udevIdx="${udevIdx}9"
    count=$(find /etc/udev/rules.d/ -name "${udevIdx}*" &> /dev/null | wc -l)
    [[ $count -eq 0 ]] && break
done 

# Check to see if the rule exists somewhere, if not add it
udevRule='"KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"'
foundUinputRule=$(grep -r 'KERNEL=="uinput"' /etc/udev | grep 'MODE="0660"' | grep 'GROUP="uinput"' | wc -l)
if [[ $foundUinputRule -eq 0 ]]
then
	echo "$udevRule" | sudo tee "/etc/udev/rules.d/${udevIdx}-input.rules" > /dev/null
	sudo udevadm control --reload-rules && sudo udevadm trigger
else
    echo "Found a rule, don't create a new one"
fi



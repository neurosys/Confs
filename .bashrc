# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


if [ -f ~/Confs/bash_files/exports ]
then
    . ~/Confs/bash_files/exports 
fi

if [ -f ~/Confs/bash_files/prompt ]
then
    . ~/Confs/bash_files/prompt 
fi


if [ -f ~/Confs/bash_files/aliases ]
then
    . ~/Confs/bash_files/aliases 
fi





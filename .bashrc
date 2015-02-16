# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Set flags corresponding to whatever this system may or may not have
if [ -f ~/Confs/bash_files/envtests ]
then
    . ~/Confs/bash_files/envtests
fi 

# Export various variables
if [ -f ~/Confs/bash_files/exports ]
then
    . ~/Confs/bash_files/exports 
fi

# Set a fancy prompt
if [ -f ~/Confs/bash_files/prompt ]
then
    . ~/Confs/bash_files/prompt 
fi

# Various aliases that I feel are useful
if [ -f ~/Confs/bash_files/aliases ]
then
    . ~/Confs/bash_files/aliases 
fi





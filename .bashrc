# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Path to whom other paths are relative to
confs_folder=~/Confs/bash_files

# Set flags corresponding to whatever this system may or may not have
if [ -f ${confs_folder}/envtests ]
then
    . ${confs_folder}/envtests
fi 

if [ -f ${confs_folder}/defines ]
then
    . ${confs_folder}/defines
fi

# Export various variables
if [ -f ${confs_folder}/exports ]
then
    . ${confs_folder}/exports
fi

# Set a fancy prompt
if [ -f ${confs_folder}/prompt ]
then
    . ${confs_folder}/prompt
fi

# Various aliases that I feel are useful on every platform
if [ -f ${confs_folder}/aliases ]
then
    . ${confs_folder}/aliases
fi

# Various local aliases, that have meaning only on this specific PC
if [ -f ${confs_folder}/.local_aliases ]
then
    . ${confs_folder}/.local_aliases
fi


# Print a status, but except the scp connections, otherwise scp transfers will fail
if [ "$TERM" != "dumb" ] && [ -f ${confs_folder}/print_status ]
then
    . ${confs_folder}/print_status
fi

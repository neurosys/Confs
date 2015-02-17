#!/usr/bin/env bash

function backup_if_exists()
{
    if [ -z $1 ]
    then
        return
    fi

    file=$1

    if [ -f $file ]
    then
        echo "$file exists"
        mv $file ${file}_backup
    fi
}


if [ $PWD == ~ ]
then
    echo "Please run this from the folder where the script is found"
    exit 0
fi

configs=".Xresources .bash_profile .bashrc .emacs .fetchmailrc .gitconfig .gitignore .minttyrc .msmtprc .muttrc .screenrc .tmux.conf .vimperatorrc"
for i in $configs
do
    echo "$i"
    backup_if_exists ~/$i
    ln -s $PWD/$i ~/$i
    sed -e "s;confs_folder=.*;confs_folder=$PWD/bash_files;" -i "$PWD/.bashrc"
done

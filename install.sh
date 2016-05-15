#!/usr/bin/env bash

function backup_if_exists()
{
    if [ -z $1 ]
    then
        return
    fi

    file=$1
    bkp_dir=$2
    if [ -z $bkp_dir ]
    then
        bkp_dir=backup_config_
    fi

    if [ -f $file ]
    then
        echo "$file exists"
        if [ -h $file ]
        then
            echo "$file is a symlink removing.."
            rm "$file"
        else 
            if [ ! -d $bkp_dir ]
            then
                mkdir $bkp_dir
            fi
            mv $file $bkp_dir/$(basename $file)
        fi
    fi
}


if [ $PWD == ~ ]
then
    echo "Please run this from the folder where the script is found"
    exit 0
fi

backup_folder="backup_config_$(date +%Y-%m-%d_%H-%M-%S)"

configs=".Xresources .bash_profile .emacs .fetchmailrc .gitignore .minttyrc .msmtprc .muttrc .screenrc .vimperatorrc"
for i in $configs
do
    echo "$i"
    backup_if_exists ~/$i $backup_folder
    ln -s $PWD/$i ~/$i
    #sed -e "s;confs_folder=.*;confs_folder=$PWD/bash_files;" -i "$PWD/.bashrc"
done

backup_if_exists ~/.bashrc
ln -s $PWD/bashrc ~/.bashrc

git submodule update --init
backup_if_exists ~/.zshrc
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/zsh/oh-my-zsh ~/.oh-my-zsh

backup_if_exists ~/.tmux.conf
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
ln -s $PWD/tmux/tmux.conf.local ~/.tmux.conf.local


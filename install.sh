#!/usr/bin/env bash

source shell/utils.sh

if [ $PWD == ~ ]
then
    echo "Please run this from the folder where the script is found"
    exit 0
fi

backup_folder="$HOME/backup_config_$(date +%Y-%m-%d_%H-%M-%S)"
echo "PWD = $PWD"

#echo "Downloading oh-my-zsh"
#git submodule update --init
#if [ $? -eq 0 ]
#then
#    echo "oh-my-zsh downloaded"
#else
#    echo "Failed to download oh-my-zsh"
#fi

link_or_fail        $PWD/shell/bashrc               ~/.bashrc          $backup_folder
link_or_fail        $PWD/shell/bash_profile         ~/.bash_profile    $backup_folder

link_or_fail        $PWD/shell/zshrc                ~/.zshrc           $backup_folder
link_or_fail        $PWD/shell/zsh/oh-my-zsh        ~/.oh-my-zsh       $backup_folder

link_or_fail        $PWD/tmux/tmux.conf             ~/.tmux.conf       $backup_folder
link_or_fail        $PWD/tmux/tmux.conf.local       ~/.tmux.conf.local $backup_folder

link_or_fail        $PWD/git.d/gitconfig            ~/.gitconfig       $backup_folder

link_or_fail        $PWD/xorg/Xresources            ~/.Xresources      $backup_folder
link_or_fail        $PWD/xorg/xbindkeysrc           ~/.xbindkeysrc     $backup_folder

link_or_fail        $PWD/.emacs                     ~/.emacs           $backup_folder
link_or_fail        $PWD/.screenrc                  ~/.screenrc        $backup_folder
link_or_fail        $PWD/.vimperatorrc              ~/.vimperatorrc    $backup_folder
link_or_fail        $PWD/.minttyrc                  ~/.minttyrc        $backup_folder

backup_if_exists    ~/.fetchmailrc                                     $backup_folder
cp                  $PWD/mail_template/fetchmailrc  ~/.fetchmailrc

backup_if_exists    ~/.muttrc                                          $backup_folder
cp                  $PWD/mail_template/muttrc       ~/.muttrc

backup_if_exists    ~/.msmtprc                                         $backup_folder
cp                  $PWD/mail_template/msmtprc      ~/.msmtprc

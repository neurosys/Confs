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

link_or_fail        $PWD/tmux/new_tmux.conf         ~/.tmux.conf       $backup_folder

link_or_fail        $PWD/git.d/gitconfig            ~/.gitconfig       $backup_folder

link_or_fail        $PWD/tigrc                      ~/.tigrc           $backup_folder

# Session variables (like the GTK theme)
link_or_fail        $PWD/xorg/pam_environment       ~/.pam_environment $backup_folder

link_or_fail        $PWD/xorg/Xresources            ~/.Xresources      $backup_folder
link_or_fail        $PWD/xorg/xbindkeysrc           ~/.xbindkeysrc     $backup_folder
link_or_fail        $PWD/xorg/xinitrc               ~/.xinitrc         $backup_folder
link_or_fail        $PWD/xorg/keybboard             ~/.keyboard        $backup_folder

mkdir -p ~/.config/kitty/
link_or_fail        $PWD/xorg/kitty.conf            ~/.config/kitty/kitty.conf         $backup_folder
mkdir -p ~/.config/alacritty
link_or_fail        $PWD/xorg/alacritty.toml        ~/.config/alacritty/alacritty.toml $backup_folder

link_or_fail        $PWD/.emacs                     ~/.emacs           $backup_folder
link_or_fail        $PWD/.screenrc                  ~/.screenrc        $backup_folder
link_or_fail        $PWD/.vimperatorrc              ~/.vimperatorrc    $backup_folder
link_or_fail        $PWD/.minttyrc                  ~/.minttyrc        $backup_folder

mkdir -p ~/.config/zathura
link_or_fail        $PWD/xorg/zathurarc             ~/.config/zathura/zathurarc $backup_folder

# default apps for mime types (used with xdg-open)
link_or_fail        $PWD/xorg/mimeapps.list         ~/.config/mimeapps.list     $backup_folder
link_or_fail        $PWD/xorg/nsxiv-rifle.desktop   ~/.local/share/applications/nsxiv-rifle.desktop $backup_folder

#backup_if_exists    ~/.fetchmailrc                                     $backup_folder
#cp                  $PWD/mail_template/fetchmailrc  ~/.fetchmailrc

#backup_if_exists    ~/.muttrc                                          $backup_folder
#cp                  $PWD/mail_template/muttrc       ~/.muttrc

#backup_if_exists    ~/.msmtprc                                         $backup_folder
#cp                  $PWD/mail_template/msmtprc      ~/.msmtprc

link_or_fail        $PWD/taskwarrior/taskrc          ~/.taskrc          $backup_folder

cp                  $PWD/.ideavimrc                  ~/.ideavimrc

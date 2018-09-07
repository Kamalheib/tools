#!/bin/sh

sudo dnf update -y 
sudo dnf groupinstall "C Development Tools and Libraries" -y 
sudo dnf install -y thunderbird gvim meld hexchat powerline vim-powerline openssl-devel ncurses-devel bc elfutils-libelf-devel mutt gnome-tweak-tool

#!/bin/sh

sudo dnf groupinstall "C Development Tools and Libraries"
sudo dnf install -y openssl-devel ncurses-devel bc elfutils-libelf-devel

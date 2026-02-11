#!/bin/bash

######################### WORK IN PROGRESS #######################################
# installer script to install dwm, dmenu, slock, slstatus, st and configure dot files on the system

# installing required tools
sudo apt install -y make gcc git libx11-dev libxft-dev libxinerama-dev libxcb1-dev xorg libinput-tools libxrandr-dev;
# installing utils
sudo apt install -y dmenu brightnessctl pamixer nala bat unclutter htop cmatrix redshift xcompmgr nmap net-tools xwallpaper arandr; 
sudo apt install -y curl wget gnupg tlp firefox-esr lxappearance onboard strace zathura moreutils;

# sound
sudo apt install -y pulseaudio pamixer pavucontrol;

# installing notification daemon
sudo apt install -y libnotify-bin notification-daemon;

# networking
sudo apt install -y network-manager network-manager-gnome;

# installing fonts
sudo apt install -y fonts-firacode fonts-noto-cjk fonts-noto-color-emoji fonts-noto;

# adding touchpad support 
echo -e 'Section "InputClass"\nIdentifier "touchpad catchall"\nDriver "libinput"\nOption "Tapping" "on"\nOption "NaturalScrolling" "on"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/30-touchpad.conf > /dev/null;

# adding dwm desktop entry
echo -e '[Desktop Entry]\nEncoding=UTF-8\nName=dwm\nExec=dwm\nType=XSession' | sudo tee  /usr/share/xsessions/dwm.desktop > /dev/null ; 

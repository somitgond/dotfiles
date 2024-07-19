#!/bin/bash

######################### WORK IN PROGRESS #######################################
# installer script to install dwm, dmenu, slock, slstatus, st and configure dot files on the system

# installing required tools
sudo apt install -y make gcc git libx11-dev libxft-dev libxinerama-dev libxcb1-dev xorg libinput-tools libxrandr-dev;
# installing utils
sudo apt install -y dmenu brightnessctl pamixer nala bat unclutter htop cmatrix redshift xcompmgr nmap wireshark net-tools xwallpaper arandr; 
sudo apt install -y curl wget gnupg tlp firefox-esr lxappearance onboard strace zathura moreutils;

# sound
sudo apt install -y pulseaudio pamixer pavucontrol;

# installing notification daemon
sudo apt install -y libnotify-bin notification-daemon;

# networking
sudo apt install -y network-manager network-manager-gnome;

# installing fonts
sudo apt install -y fonts-firacode fonts-noto-cjk fonts-noto-color-emoji fonts-noto;

# cloning my dotfiles
#git clone https://github.com/somitgond/dotfiles --depth=1;

# installing dwm, slock, slstatus, st
git clone https://github.com/somitgond/dwm
cd dwm;
sudo make clean install;
make clean;
cd .. ;

git clone https://github.com/somitgond/slstatus
cd slstatus;
sudo make clean install;
make clean;
cd .. ;

git clone https://github.com/somitgond/st
cd st;
sudo make clean install;
make clean;
cd .. ;

git clone https://git.suckless.org/slock
cd slock
sudo make clean install;
cd .. ;

# cp .bashrc .bash_profile .vimrc .xinitrc .xprofile .Xresources ~/; 

# adding touchpad support 
echo -e 'Section "InputClass"\nIdentifier "touchpad catchall"\nDriver "libinput"\nOption "Tapping" "on"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/30-touchpad.conf > /dev/null;

# adding dwm desktop entry
echo -e '[Desktop Entry]\nEncoding=UTF-8\nName=dwm\nExec=dwm\nType=XSession' | sudo tee  /usr/share/xsessions/dwm.desktop > /dev/null ; 


# adding custom repos 

#google chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ;
echo 'deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list;
sudo apt update;
sudo apt install -y google-chrome-stable;

# installing mullvad browser
 sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc ;
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list ;
sudo apt install mullvad-browser;
